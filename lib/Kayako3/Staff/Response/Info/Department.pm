package Kayako3::Staff::Response::Info::Department;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'assigned' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "assigned",
        Prefix => "",
        node_type => "attribute",
        Name => "assigned",
        NamespaceURI => "",
        sort_order => 0,
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
        sort_order => 1,
     },
);
has 'parentdepartmentid' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "parentdepartmentid",
        Prefix => "",
        node_type => "attribute",
        Name => "parentdepartmentid",
        NamespaceURI => "",
        sort_order => 2,
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
        sort_order => 3,
     },
);
1;

__END__
