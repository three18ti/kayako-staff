package Kayako3::Staff::Response::Info::Emailqueue;
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
has 'email' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "email",
        Prefix => "",
        node_type => "attribute",
        Name => "email",
        NamespaceURI => "",
        sort_order => 1,
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
        sort_order => 2,
     },
);
1;

__END__
