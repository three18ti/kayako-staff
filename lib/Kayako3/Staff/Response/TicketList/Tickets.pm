package Kayako3::Staff::Response::TicketList::Tickets;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'ticket_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::TicketList::Ticket]',
     is          => 'ro',     init_arg    => 'tickets',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_ticket => ['push'] },     description => {
        LocalName => "ticket",
        Prefix => "",
        node_type => "child",
        Name => "ticket",
        NamespaceURI => "",
        sort_order => 0,
     },
);
1;

__END__
