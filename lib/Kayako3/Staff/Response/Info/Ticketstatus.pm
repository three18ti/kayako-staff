package Kayako3::Staff::Response::Info::Ticketstatus;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'bgcolor' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "bgcolor",
        Prefix => "",
        node_type => "attribute",
        Name => "bgcolor",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'canchangestatus' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "canchangestatus",
        Prefix => "",
        node_type => "attribute",
        Name => "canchangestatus",
        NamespaceURI => "",
        sort_order => 1,
     },
);
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
        sort_order => 2,
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
        sort_order => 3,
     },
);
has 'fgcolor' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "fgcolor",
        Prefix => "",
        node_type => "attribute",
        Name => "fgcolor",
        NamespaceURI => "",
        sort_order => 4,
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
        sort_order => 5,
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
        sort_order => 6,
     },
);
has 'markasresolved' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "markasresolved",
        Prefix => "",
        node_type => "attribute",
        Name => "markasresolved",
        NamespaceURI => "",
        sort_order => 7,
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
        sort_order => 8,
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
        sort_order => 9,
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
        sort_order => 10,
     },
);
1;

__END__
