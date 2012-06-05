package Kayako3::Staff::Response::Info::Staff;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'departments' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "departments",
        Prefix => "",
        node_type => "attribute",
        Name => "departments",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'designation' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "designation",
        Prefix => "",
        node_type => "attribute",
        Name => "designation",
        NamespaceURI => "",
        sort_order => 1,
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
        sort_order => 2,
     },
);
has 'firstname' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "firstname",
        Prefix => "",
        node_type => "attribute",
        Name => "firstname",
        NamespaceURI => "",
        sort_order => 3,
     },
);
has 'fullname' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "fullname",
        Prefix => "",
        node_type => "attribute",
        Name => "fullname",
        NamespaceURI => "",
        sort_order => 4,
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
        sort_order => 5,
     },
);
has 'lastname' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "lastname",
        Prefix => "",
        node_type => "attribute",
        Name => "lastname",
        NamespaceURI => "",
        sort_order => 6,
     },
);
has 'lastvisit' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "lastvisit",
        Prefix => "",
        node_type => "attribute",
        Name => "lastvisit",
        NamespaceURI => "",
        sort_order => 7,
     },
);
has 'mobilenumber' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "mobilenumber",
        Prefix => "",
        node_type => "attribute",
        Name => "mobilenumber",
        NamespaceURI => "",
        sort_order => 8,
     },
);
has 'timezone' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "timezone",
        Prefix => "",
        node_type => "attribute",
        Name => "timezone",
        NamespaceURI => "",
        sort_order => 9,
     },
);
has 'username' => (
     isa         => 'Str',
     is          => 'ro',   
     traits      => [ 'XML'],
     description => {
        LocalName => "username",
        Prefix => "",
        node_type => "attribute",
        Name => "username",
        NamespaceURI => "",
        sort_order => 10,
     },
);
1;

__END__
