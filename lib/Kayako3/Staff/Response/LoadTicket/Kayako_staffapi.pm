package Kayako3::Staff::Response::LoadTicket::Kayako_staffapi;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'count_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Count]',
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
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Error]',
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
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Status]',
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
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Tickets]',
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

sub get_ticket_subject {
    my $self = shift;

    $self->tickets_collection->[0]->ticket_collection->[0]->post_collection->[0]->subject_collection->[0]->text;
}

sub get_ticket_body {
    my $self = shift;

    $self->tickets_collection->[0]->ticket_collection->[0]->post_collection->[0]->contents_collection->[0]->text;
}

sub get_ticket_id {
    my $self = shift;

    $self->tickets_collection->[0]->ticket_collection->[0]->displayid_collection->[0]->text;
}

sub get_ticket_sender {

}

no Moose;
__PACKAGE__->meta->make_immutable;
1;
__END__

