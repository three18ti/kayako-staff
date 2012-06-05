package Kayako3::Staff::Response::Info::Ticketsummary;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'inbox' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "inbox",
        Prefix => "",
        node_type => "attribute",
        Name => "inbox",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'mytickets' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "mytickets",
        Prefix => "",
        node_type => "attribute",
        Name => "mytickets",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'trash' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "trash",
        Prefix => "",
        node_type => "attribute",
        Name => "trash",
        NamespaceURI => "",
        sort_order => 2,
     },
);
has 'unassigned' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "unassigned",
        Prefix => "",
        node_type => "attribute",
        Name => "unassigned",
        NamespaceURI => "",
        sort_order => 3,
     },
);
1;

__END__
