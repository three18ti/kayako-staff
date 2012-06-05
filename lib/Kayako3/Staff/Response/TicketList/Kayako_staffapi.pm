package Kayako3::Staff::Response::TicketList::Kayako_staffapi;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'count_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::TicketList::Count]',
     is          => 'ro',     init_arg    => 'counts',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_count => ['push'] },     description => {
        LocalName => "count",
        Prefix => "",
        node_type => "child",
        Name => "count",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'error_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::TicketList::Error]',
     is          => 'ro',     init_arg    => 'errors',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_error => ['push'] },     description => {
        LocalName => "error",
        Prefix => "",
        node_type => "child",
        Name => "error",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'status_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::TicketList::Status]',
     is          => 'ro',     init_arg    => 'statuss',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_status => ['push'] },     description => {
        LocalName => "status",
        Prefix => "",
        node_type => "child",
        Name => "status",
        NamespaceURI => "",
        sort_order => 2,
     },
);
has 'tickets_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::TicketList::Tickets]',
     is          => 'ro',     init_arg    => 'ticketss',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_tickets => ['push'] },     description => {
        LocalName => "tickets",
        Prefix => "",
        node_type => "child",
        Name => "tickets",
        NamespaceURI => "",
        sort_order => 3,
     },
);

has 'ticket_list' => (
    is      => 'rw',
    isa     => 'ArrayRef',
    lazy    => 1,
    builder => '_list_ticket_info',
);

sub _list_ticket_info {
    my $self = shift;

    my $ticket_list = (); 
    foreach my $ticket ( $self->tickets_collection->[0]->ticket_collection ) {
        push @{$ticket_list}, {
            id              => $ticket->id,
            ticket_number   => $ticket->displayid_collection->[0]->text,
            subject         => $ticket->subject_collection->[0]->text,
        }
    }
    return $ticket_list;
}

sub get_ticket_count {
    my $self = shift;
    
    my $ticket_count = @{$self->tickets_collection->[0]->ticket_collection};
}

1;
__END__
