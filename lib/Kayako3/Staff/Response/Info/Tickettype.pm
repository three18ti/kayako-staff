package Kayako3::Staff::Response::Info::Tickettype;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'departmentid' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "departmentid",
        Prefix => "",
        node_type => "attribute",
        Name => "departmentid",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'displayorder' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "displayorder",
        Prefix => "",
        node_type => "attribute",
        Name => "displayorder",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'iconurl' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "iconurl",
        Prefix => "",
        node_type => "attribute",
        Name => "iconurl",
        NamespaceURI => "",
        sort_order => 2,
     },
);
has 'id' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "id",
        Prefix => "",
        node_type => "attribute",
        Name => "id",
        NamespaceURI => "",
        sort_order => 3,
     },
);
has 'title' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "title",
        Prefix => "",
        node_type => "attribute",
        Name => "title",
        NamespaceURI => "",
        sort_order => 4,
     },
);
1;

__END__
