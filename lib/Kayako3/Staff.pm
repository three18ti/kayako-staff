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



1;
