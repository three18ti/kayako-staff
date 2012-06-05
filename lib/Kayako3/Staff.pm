package Kayako3::Staff;
use 5.010;

use Moose;
use strict;
use warnings;

use IO::Uncompress::Gunzip qw(gunzip $GunzipError) ;
use XML::Toolkit::App;
use Carp;

=head1 NAME

Kayako3::Staff - Interface for Kayako API

=cut

=head1 Required Parameters

=over 4

=item username

Kayako Helpdesk Username

=back

=cut

has 'username' => (
    is => 'ro',
    isa => 'Str',
    required => 1,
);

=over 4

=item password

Your Kayako Staff Password

=back

=cut

has 'password' => (
    is => 'ro',
    isa => 'Str',
    required => 1,
    trigger => \&_do_login,
);

=over 4

=item api_url

The Staff API URl, should end with a question mark

=back

=cut

has 'api_url' => (
    is => 'rw',
    isa => 'Str',
    required => 1,
);

=head1 Collections

=over 4

=item _api_urls

Should not be accessed directly, provides access to the Kayako Staff API URLS

=back

=cut

use Kayako3::Staff::Collection::APIUrls;

has '_api_urls' => (
    is      => 'ro',
    isa     => 'Kayako3::Staff::Collection::APIUrls',
    lazy    => 1,
    default => sub { Kayako3::Staff::Collection::APIUrls->new( { _base_url => $_[0]->api_url} ) },
    handles => qr/^(?:.*)/,
);


=head1 Object Storage

=head2 General Objects

=over 4

=item ua

LWP::UserAgent, provides delegation for post, get, and agent_cookie_jar methods

=back

=cut

use LWP::UserAgent;
has 'ua' => (
    is  => 'rw',
    isa => 'LWP::UserAgent',
    lazy    => 1,
    default => sub { my $agent = LWP::UserAgent->new; $agent->agent($_[0]->_user_agent); $agent; },
    handles => {
        post                => 'post',
        get                 => 'get',
        agent_cookie_jar    => 'cookie_jar'
    }
);

=over 4

=item _cookie_jar

Object storage for HTTP::Cookies object,
not accessed directly

=cut

use HTTP::Cookies;
has '_cookie_jar' => (
    is => 'rw',
    isa => 'HTTP::Cookies',
    lazy => 1,
    default => sub { HTTP::Cookies->new },
);

=head2 Kayako Response Objects

=over 4

=item login_response

Login response object

Object storage for Kayako3::Staff::Response::Login::Kayako_staffapi object.

Stores the XML response from $self->_do_login as a Moose object for easy access

=back

=cut

use Kayako3::Staff::Response::Login::Kayako_staffapi;
has 'login_response' => (
    is => 'rw',
    isa => 'Kayako3::Staff::Response::Login::Kayako_staffapi',
    lazy => 1,
    builder => '_do_login',
    handles => qr/^(?:_.*)/,
);

=over 4

=item logut_response

Logout response object

Object storage for Kayako3::Staff::Response::Logout::Kayako_staffapi

Stores the XML response from $self->_do_logout as a Moose object

=back

=cut

use Kayako3::Staff::Response::Logout::Kayako_staffapi;
has 'logout_response' => (
    is => 'rw',
    isa => 'Kayako3::Staff::Response::Logout::Kayako_staffapi',
    lazy => 1,
    handles => qr/^(?:_.*)/,
);

=over 4

=item info_response

info response object

Object storage for Kayako3::Staff::Response::Info::Kayako_staffapi

=back

=cut

use Kayako3::Staff::Response::Info::Kayako_staffapi;
has 'info_response' => (
    is => 'rw',
    isa => 'Kayako3::Staff::Response::Info::Kayako_staffapi',
    lazy => 1,
    handles => qr/^(?:_.*|get.*)/,
);

=over 4

=head2 ticket_list_respnse

ticket list response object

Object storage for Kayako3::Staff::Response::TicketList

=back

=cut

use Kayako3::Staff::Response::TicketList::Kayako_staffapi;
has 'ticket_list_response' => (
    is => 'rw',
    isa => 'Kayako3::Staff::Response::TicketList::Kayako_staffapi',
    lazy => 1,
    handles => qr/^(?:_.*|ticket_list|get.*)/,
);

=head2 load_ticket_response

Loaded Ticket response obkect

Object storage for Kayako3::Staff::Response::LoadTicket

=cut

use Kayako3::Staff::Response::LoadTicket::Kayako_staffapi;
has 'load_ticket_response' => (
    is          => 'rw',
    isa         => 'Kayako3::Staff::Response::LoadTicket::Kayako_staffapi',
    lazy        => 1,
    handles     => qr/^(?:_.*|get.*)/,
);

=head1 Private Helper Functions

Private functuions used by the application, should never be called directly

=over 4

=item _dispatch_request

performs the API call, returns the response body unzipped

=back

=cut

sub _dispatch_request {
    my $self = shift;
    my $api_url = shift;
    my $parameters = shift;

    my $response = $self->post($api_url, $parameters);
    my $content = $self->_unzip($response->content);

}

=head1 Public Functions

=over 4

=item login

Perfoms the login operation and stores the login object.

=cut

sub login {
    my $self = shift;

    my $xml_response = $self->_dispatch_request(
        $self->_api_login => {
            username            => $self->username,
            password            => $self->password,
        },
    );
    my $loader 
        = XML::Toolkit::App->new( xmlns => { '' => 'Kayako3::Staff::Response::Login' } )->loader;
    $loader->parse_string( $unzipped_content );
    $self->{login} = shift $loader->filter->objects;
}

=over 4

=item logout

Perfoms the logout operation and stores the logout object

=back

=cut

sub logout {
    my $self = shift;
    
    my $xml_response = $_dispatch_request(
        $self->_api_logout => {
            sessionid => $self->_session_id,
        },
    );
    my $loader =  XML::Toolkit::App->new( xmlns => { '' => 'Kayako3::Staff::Response::Logout' } )->loader;
    $loader->parse_string( $xml_response );
    my $self->{logout} = shift $loader->filter->objects;
}


=head1 Utility Methods

These are methods used internally by the application, should never need to be called externally

=over 4

=item _unzip

Unzips the response content

=back

=cut

sub _unzip {
    my $self = shift;
    my $input = shift;

    open my $FHIN, '<', \$input;
    open my $FHOUT, '>', \my $xml_response;

    gunzip $FHIN => $FHOUT
        or warn "gunzip failed: $GunzipError\n";

    return $xml_response;
}


=over 4

=item _check_ticket_id

Performs check if ticket_id is numberical or is passed as full ticket ID

=back

=cut

=cut

sub _check_ticket_id {
    my $self = shift;
    my $ticket = shift;

    my $ticket_id = 'Ticket ID Not Found';
    if ($ticket =~ /^[+-]?\d+$/ ) {
        $ticket_id = $ticket;
    }
    else {
        foreach (@{$self->ticket_list}) {
            if ($_->{ticket_number} eq $ticket) {
                $ticket_id = $_->{id};
            }
        }
    }
    return $ticket_id;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Kayako3::Staff
__END__
