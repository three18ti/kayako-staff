package Kayako3::Staff::Response::LoadTicket::Note;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'creationdate' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "creationdate",
        Prefix => "",
        node_type => "attribute",
        Name => "creationdate",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'creatorstaffid' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "creatorstaffid",
        Prefix => "",
        node_type => "attribute",
        Name => "creatorstaffid",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'creatorstaffname' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "creatorstaffname",
        Prefix => "",
        node_type => "attribute",
        Name => "creatorstaffname",
        NamespaceURI => "",
        sort_order => 2,
     },
);
has 'forstaffid' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "forstaffid",
        Prefix => "",
        node_type => "attribute",
        Name => "forstaffid",
        NamespaceURI => "",
        sort_order => 3,
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
        sort_order => 4,
     },
);
has 'notecolor' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "notecolor",
        Prefix => "",
        node_type => "attribute",
        Name => "notecolor",
        NamespaceURI => "",
        sort_order => 5,
     },
);
has 'text' => (
     isa         => 'Str',
     is          => 'rw',   
     traits      => [ 'XML'],
     description => {
        node_type => "character",
        cdata => "1",
        sort_order => 6,
     },
);
has 'type' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "type",
        Prefix => "",
        node_type => "attribute",
        Name => "type",
        NamespaceURI => "",
        sort_order => 7,
     },
);
1;

__END__
