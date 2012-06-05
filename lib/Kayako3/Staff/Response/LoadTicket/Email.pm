package Kayako3::Staff::Response::LoadTicket::Email;
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
1;

__END__
