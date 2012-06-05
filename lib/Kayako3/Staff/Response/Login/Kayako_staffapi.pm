package Kayako3::Staff::Response::Login::Kayako_staffapi;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'error_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Login::Error]',
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
        sort_order => 0,
     },
);
has 'sessionid_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Login::Sessionid]',
     is          => 'ro',     init_arg    => 'sessionids',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_sessionid => ['push'] },     description => {
        LocalName => "sessionid",
        Prefix => "",
        node_type => "child",
        Name => "sessionid",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'sessiontimeout_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Login::Sessiontimeout]',
     is          => 'ro',     init_arg    => 'sessiontimeouts',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_sessiontimeout => ['push'] },     description => {
        LocalName => "sessiontimeout",
        Prefix => "",
        node_type => "child",
        Name => "sessiontimeout",
        NamespaceURI => "",
        sort_order => 2,
     },
);
has 'staffid_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Login::Staffid]',
     is          => 'ro',     init_arg    => 'staffids',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_staffid => ['push'] },     description => {
        LocalName => "staffid",
        Prefix => "",
        node_type => "child",
        Name => "staffid",
        NamespaceURI => "",
        sort_order => 3,
     },
);
has 'status_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Login::Status]',
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
        sort_order => 4,
     },
);
has 'version_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Login::Version]',
     is          => 'ro',     init_arg    => 'versions',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_version => ['push'] },     description => {
        LocalName => "version",
        Prefix => "",
        node_type => "child",
        Name => "version",
        NamespaceURI => "",
        sort_order => 5,
     },
);

sub _session_id {
    my $self = shift;
    $self->sessionid_collection->[0]->text;
}

sub _session_timeout {
    my $self = shift;
    $self->session_collection->[0]->text;
}

sub _my_staff_id {
    my $self = shift;
    $self->staffid_collection->[0]->text;
}

sub _my_version {
    my $self = shift;
    $self->version_collection->[0]->text;
}

sub _login_error {
    my $self = shift;
    $self->error_collection->[0]->text;
}

sub _login_response_status {
    my $self = shift;
    $self->status_collection->[0]->text;
}

1;

__END__
