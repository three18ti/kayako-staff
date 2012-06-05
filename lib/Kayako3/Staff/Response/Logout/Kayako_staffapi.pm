package Kayako3::Staff::Response::Logout::Kayako_staffapi;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'status_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Logout::Status]',
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
        sort_order => 0,
     },
);

sub _is_logged_out {
    my $self = shift;

    $self->status_collection->[0]->text;
}

1;
__END__
