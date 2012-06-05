package Kayako3::Staff::Collection::APIUrls;

use v5.14.2;
use strict;
use warnings;

use Moose;

has '_base_url' => (
    is      => 'ro',
    isa     => 'Str',
    required => 1,
);

has '_api_login' => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->_base_url . '/Core/Default/Login' },
);

has '_api_logout' => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->_base_url . '/Core/Default/Logout' },
);

has '_api_get_info' => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->_base_url . '/Core/Default/GetInfo' },
);

has '_api_ticket_list' => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->_base_url . '/Tickets/Retrieve' },,
);

has '_api_ticket_load' => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->_base_url . '/Tickets/Retrieve/Data' },
);

has '_api_ticket_attachemnt' => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->_base_url . '/Tickets/Retrieve/Attachment' },
);

has '_api_ticket_update' => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->_base_url . '/Tickets/Push/Index' },
);

has '_api_ticket_search' => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { $_[0]->_base_url . '/Tickets/Retrieve/Search' },
);


no Moose;
__PACKAGE__->meta->make_immutable;
1;
__END__
