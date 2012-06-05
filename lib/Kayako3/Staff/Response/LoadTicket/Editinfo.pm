package Kayako3::Staff::Response::LoadTicket::Editinfo;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'edited' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "edited",
        Prefix => "",
        node_type => "attribute",
        Name => "edited",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'staffid' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "staffid",
        Prefix => "",
        node_type => "attribute",
        Name => "staffid",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'time' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "time",
        Prefix => "",
        node_type => "attribute",
        Name => "time",
        NamespaceURI => "",
        sort_order => 2,
     },
);
1;

__END__
