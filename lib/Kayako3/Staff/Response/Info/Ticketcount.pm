package Kayako3::Staff::Response::Info::Ticketcount;
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
has 'is_new' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
    init_arg    => 'new',
     description => {
        LocalName => "new",
        Prefix => "",
        node_type => "attribute",
        Name => "new",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'statusid' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "statusid",
        Prefix => "",
        node_type => "attribute",
        Name => "statusid",
        NamespaceURI => "",
        sort_order => 2,
     },
);
has 'ticketcount' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "ticketcount",
        Prefix => "",
        node_type => "attribute",
        Name => "ticketcount",
        NamespaceURI => "",
        sort_order => 3,
     },
);
1;

__END__
