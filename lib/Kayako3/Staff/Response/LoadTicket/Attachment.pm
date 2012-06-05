package Kayako3::Staff::Response::LoadTicket::Attachment;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'filename' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "filename",
        Prefix => "",
        node_type => "attribute",
        Name => "filename",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'filesize' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "filesize",
        Prefix => "",
        node_type => "attribute",
        Name => "filesize",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'filetype' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "filetype",
        Prefix => "",
        node_type => "attribute",
        Name => "filetype",
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
1;

__END__
