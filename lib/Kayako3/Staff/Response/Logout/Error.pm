package Kayako3::Staff::Response::Logout::Error;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'text' => (
     isa         => 'Str',
     is          => 'rw',
     traits      => [ 'XML'],
     description => {
        node_type => "character",
        cdata => "1",
        sort_order => 0,
     },
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;
__END__
