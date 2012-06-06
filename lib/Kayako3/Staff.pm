package Kayako3::Staff;
use 5.010;

use Moose;
use strict;
use warnings;

use IO::Uncompress::Gunzip qw(gunzip $GunzipError) ;
use XML::Toolkit::App;
use Carp;

=pod

=head1 NAME

Kayako3::Staff - Interface for Kayako API

=head1 SYNOPSIS

API Wrapper for the Kayako3 StaffAPI

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
    trigger => \&_initial_login,
);

=over 4

=item api_url

The Staff API URL, should end with a question mark

=back

=cut

has 'api_url' => (
    is => 'rw',
    isa => 'Str',
    required => 1,
);

=over 4

=item user_agent

For somereason, Kayako3 doesn't like when we advertise that our agent is LWP, this resolves that issue
Feel free to override

=back

=cut

has 'user_agent' => (
    is      => 'rw',
    isa     => 'Str',
    default => 'DEADBEEF',
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
    default => sub { my $agent = LWP::UserAgent->new; $agent->agent($_[0]->user_agent); $agent; },
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

=back

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

=back

=cut

use Kayako3::Staff::Response::Login::Kayako_staffapi;
has 'login_response' => (
    is => 'rw',
    isa => 'Kayako3::Staff::Response::Login::Kayako_staffapi',
    lazy => 1,
    handles => qr/^(?:_.*)/,
    builder => 'login',
#    default => sub { Kayako3::Staff::Response::Login::Kayako_staffapi->new },
);

=over 4

=item logut_response

Logout response object

Object storage for Kayako3::Staff::Response::Logout::Kayako_staffapi

=back

=cut

use Kayako3::Staff::Response::Logout::Kayako_staffapi;
has 'logout_response' => (
    is => 'rw',
    isa => 'Kayako3::Staff::Response::Logout::Kayako_staffapi',
    lazy => 1,
    handles => qr/^(?:_.*)/,
    default => sub { Kayako3::Staff::Response::Logout::Kayako_staffapi->new },
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
    default => sub { Kayako3::Staff::Response::Info::Kayako_staffapi->new },

);

=over 4

=item ticket_list_respnse

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
    default  => sub { Kayako3::Staff::Response::TicketList::Kayako_staffapi->new },
);

=over 4

=item load_ticket_response

Loaded Ticket response obkect

Object storage for Kayako3::Staff::Response::LoadTicket

=back

=cut

use Kayako3::Staff::Response::LoadTicket::Kayako_staffapi;
has 'load_ticket_response' => (
    is          => 'rw',
    isa         => 'Kayako3::Staff::Response::LoadTicket::Kayako_staffapi',
    lazy        => 1,
    handles     => qr/^(?:_.*|get.*)/,
    default     => sub { Kayako3::Staff::Response::LoadTicket::Kayako_staffapi->new },
);

=over 4

=item ticket_attachment_response

Loaded Ticket Attachment

Object storage for Kayako3::Staff::Response::LoadAttachment

=back

=cut

use Kayako3::Staff::Response::LoadAttachment::Kayako_staffapi;
has 'ticket_attachment_response' => (
    is          => 'rw',
    isa         => 'Kayako3::Staff::Response::LoadAttachment::Kayako_staffapi',
    lazy        => 1,
    handles     => qr/^(?:_.*|get.*)/,
    default     => sub { Kayako3::Staff::Response::LoadAttachment::Kayako_staffapi->new },
);

=over 4

=item update_ticket_response

Response object for ticket update action

=back

=cut

use Kayako3::Staff::Response::UpdateTicket::Kayako_staffapi;
has 'update_ticket_response' => (
    is          => 'rw',
    isa         => 'Kayako3::Staff::Response::UpdateTicket::Kayako_staffapi',
    lazy        => 1,
    handles     => qr/^(?:_.*|get.*)/,
    default     => sub { Kayako3::Staff::Response::UpdateTicket::Kayako_staffapi->new },
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

=over 4

=item _initial_login

Perfoms the login and get_info actions when initializing the Kayako3::Staff object

=back

=cut

sub _initial_login {
    my $self = shift;

    $self->login;
    $self->get_info;
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
    $loader->parse_string( $xml_response );
    $self->{login} = shift $loader->filter->objects;
}

=over 4

=item logout

Perfoms the logout operation and stores the logout object

=back

=cut

sub logout {
    my $self = shift;
    
    my $xml_response = $self->_dispatch_request(
        $self->_api_logout => {
            sessionid => $self->_session_id,
        },
    );
    my $loader =  XML::Toolkit::App->new( xmlns => { '' => 'Kayako3::Staff::Response::Logout' } )->loader;
    $loader->parse_string( $xml_response );
    $self->{logout} = shift $loader->filter->objects;
}

=over 4

=item get_info

Initializes base info, delegates methods for accessing and translating keys

Optionally, you may pass the 1 as the second and third parameters if you need 

=back

=cut

sub get_info {
    my $self            = shift;
    my $want_macros     = shift || 0;
    my $want_avatars    = shift || 0;    

    my $xml_response = $self->_dispatch_request(
        $self->_api_get_info => {
            sessionid       => $self->_session_id,
            wantmacros      => $want_macros,
            wantavatars     => $want_avatars,
        },
    );
    my $loader =  XML::Toolkit::App->new( xmlns => { '' => 'Kayako3::Staff::Response::Info' } )->loader;
    $loader->parse_string( $xml_response );
    $self->{info_response} = shift $loader->filter->objects;
}


=over 4

=item get_ticket_list

Retrieve ticket list for specified department and (optional) status

=back

=cut

sub get_ticket_list {
    my $self = shift;
    my $department_id = shift;
    my $status_id = shift;
    my $optional_parameters = pop;

    $optional_parameters->{statusid} = $status_id if $status_id;

    my $xml_response = $self->_dispatch_request(
        $self->_api_ticket_list => {
            sessionid       => $self->_session_id,
            departmentid   => $department_id,
            %$optional_parameters
        },
    );
    my $loader =  XML::Toolkit::App->new( xmlns => { '' => 'Kayako3::Staff::Response::TicketList' } )->loader;
    $loader->parse_string( $xml_response );
    $self->{ticket_list_response} = shift $loader->filter->objects;
}

=over 4

=item load_ticket

Retrieve a ticket from the previously loaded ticket list

=back

=cut

sub load_ticket {
    my $self                = shift;
    my $ticket_id            = shift;
    my $optional_parameters = shift;    
    
    my $xml_response = $self->_dispatch_request(
        $self->_api_ticket_load => {
            sessionid   => $self->_session_id,
            ticketid    => $ticket_id,
#            %$optional_parameters if $%optional_parameters,
        },
    );
    my $loader =  XML::Toolkit::App->new( xmlns => { '' => 'Kayako3::Staff::Response::LoadTicket' } )->loader;
    $loader->parse_string( $xml_response );
    $self->{load_ticket_response} = shift $loader->filter->objects;
}

=over 4

=item load_attachment

Retrieve an attchment for a ticket, requires ticket_id and attachment_id

=back

=cut

sub load_attachment {
    my $self = shift;
    my $ticket_id = shift;
    my $attachment_id = shift;

    my $xml_response = $self->_dispatch_request(
        $self->_api_ticket_attachment => {
            sessionid       => $self->_session_id,
            ticketid        => $ticket_id,
            attachmentid    => $attachment_id,
        }
    );

    my $loader =  XML::Toolkit::App->new( xmlns => { '' => 'Kayako3::Staff::Response::LoadAttachment' } )->loader;
    $loader->parse_string( $xml_response );
    $self->{load_ticket_response} = shift $loader->filter->objects;
}

=over 4

=item update_ticket 

Updates an existing ticket (or creates a new one?)

=back

=cut

sub update_ticket {
    my $self = shift;
    my $payload = shift;

    my $xml_response = $self->_dispatch_request(
        $self->_api_ticket_update => {
            sessionid   => $self->_session_id,
            payload     => $payload,
        }
    );
    
    my $loader 
        = XML::Toolkit::App->new( xmlns => { '' => 'Kayako3::Staff::Response::UpdateTicket::Kayako_staffapi' } )->loader;
    $loader->parse_string( $xml_response );
    $self->{load_ticket_response} = shift $loader->filter->objects;
}

=back

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
