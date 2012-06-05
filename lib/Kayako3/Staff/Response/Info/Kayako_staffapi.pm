package Kayako3::Staff::Response::Info::Kayako_staffapi;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'companyname_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Companyname]',
     is          => 'ro',     init_arg    => 'companynames',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_companyname => ['push'] },     description => {
        LocalName => "companyname",
        Prefix => "",
        node_type => "child",
        Name => "companyname",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'department_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Department]',
     is          => 'ro',     init_arg    => 'departments',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_department => ['push'] },     description => {
        LocalName => "department",
        Prefix => "",
        node_type => "child",
        Name => "department",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'emailqueue_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Emailqueue]',
     is          => 'ro',     init_arg    => 'emailqueues',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_emailqueue => ['push'] },     description => {
        LocalName => "emailqueue",
        Prefix => "",
        node_type => "child",
        Name => "emailqueue",
        NamespaceURI => "",
        sort_order => 2,
     },
);
has 'error_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Error]',
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
        sort_order => 3,
     },
);
has 'product_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Product]',
     is          => 'ro',     init_arg    => 'products',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_product => ['push'] },     description => {
        LocalName => "product",
        Prefix => "",
        node_type => "child",
        Name => "product",
        NamespaceURI => "",
        sort_order => 4,
     },
);
has 'staff_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Staff]',
     is          => 'ro',     init_arg    => 'staffs',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_staff => ['push'] },     description => {
        LocalName => "staff",
        Prefix => "",
        node_type => "child",
        Name => "staff",
        NamespaceURI => "",
        sort_order => 5,
     },
);
has 'staffgroup_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Staffgroup]',
     is          => 'ro',     init_arg    => 'staffgroups',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_staffgroup => ['push'] },     description => {
        LocalName => "staffgroup",
        Prefix => "",
        node_type => "child",
        Name => "staffgroup",
        NamespaceURI => "",
        sort_order => 6,
     },
);
has 'status_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Status]',
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
        sort_order => 7,
     },
);
has 'ticketcount_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Ticketcount]',
     is          => 'ro',     init_arg    => 'ticketcounts',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_ticketcount => ['push'] },     description => {
        LocalName => "ticketcount",
        Prefix => "",
        node_type => "child",
        Name => "ticketcount",
        NamespaceURI => "",
        sort_order => 8,
     },
);
has 'ticketfilter_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Ticketfilter]',
     is          => 'ro',     init_arg    => 'ticketfilters',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_ticketfilter => ['push'] },     description => {
        LocalName => "ticketfilter",
        Prefix => "",
        node_type => "child",
        Name => "ticketfilter",
        NamespaceURI => "",
        sort_order => 9,
     },
);
has 'ticketpriority_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Ticketpriority]',
     is          => 'ro',     init_arg    => 'ticketprioritys',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_ticketpriority => ['push'] },     description => {
        LocalName => "ticketpriority",
        Prefix => "",
        node_type => "child",
        Name => "ticketpriority",
        NamespaceURI => "",
        sort_order => 10,
     },
);
has 'ticketstatus_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Ticketstatus]',
     is          => 'ro',     init_arg    => 'ticketstatuss',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_ticketstatus => ['push'] },     description => {
        LocalName => "ticketstatus",
        Prefix => "",
        node_type => "child",
        Name => "ticketstatus",
        NamespaceURI => "",
        sort_order => 11,
     },
);
has 'ticketsummary_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Ticketsummary]',
     is          => 'ro',     init_arg    => 'ticketsummarys',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_ticketsummary => ['push'] },     description => {
        LocalName => "ticketsummary",
        Prefix => "",
        node_type => "child",
        Name => "ticketsummary",
        NamespaceURI => "",
        sort_order => 12,
     },
);
has 'tickettype_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Tickettype]',
     is          => 'ro',     init_arg    => 'tickettypes',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_tickettype => ['push'] },     description => {
        LocalName => "tickettype",
        Prefix => "",
        node_type => "child",
        Name => "tickettype",
        NamespaceURI => "",
        sort_order => 13,
     },
);
has 'uniqueid_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Uniqueid]',
     is          => 'ro',     init_arg    => 'uniqueids',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_uniqueid => ['push'] },     description => {
        LocalName => "uniqueid",
        Prefix => "",
        node_type => "child",
        Name => "uniqueid",
        NamespaceURI => "",
        sort_order => 14,
     },
);
has 'version_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::Info::Version]',
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
        sort_order => 15,
     },
);

sub get_company_name        { $_[0]->companyname_collection->[0]->text  }
sub get_product             { $_[0]->product_collection->[0]->text      }
sub get_info_status         { $_[0]->status_collection->[0]->text       }


sub get_user_by_id {
    my $self = shift;
    my $user_id = shift;

    my $user;
    foreach ($self->staff_collection) {
        if ($_->id == $user_id) {
            $user = $_;
            last;
        }
        
    }
    return $user;
}

sub get_user_by_name {
    my $self = shift;
    my $search_string = shift;

    my $user;
    foreach ($self->staff_collection) {
        if ($_->fullname =~ m/$search_string/g) {
            next if $_->fullname =~ m/Import/g;
            $user = $_;
            last
        }
    }    
    return $user;
}

# search by ID to get stafff group name
sub get_staff_group_name {
    my $self = shift;
    my $group_id = shift;

    my $group;
    foreach ($self->staffgroup_collection) {
        if ($_->id == $group_id) {
            $group = $_;
            last;
        }

    }
    return $group->title;
}

# search by NAME to get staff group ID
sub get_staff_group_id {
    my $self = shift;
    my $search_string = shift;

    my $group;
    foreach ($self->staffgroup_collection) {
        if ($_->title =~ m/$search_string/g) {
            $group = $_;
            last
        }
    }
    return $group->id;
}

sub get_department_name {
    my $self = shift;
    my $department_id = shift;

    my $department;
    foreach ($self->department_collection) {
        if ($_->id == $department_id) {
            $department = $_;
            last;
        }

    }
    return $department->title;
}

# search by NAME to get staff group ID
sub get_department_id {
    my $self = shift;
    my $search_string = shift;

    my $department;
    foreach ($self->department_collection) {
        if ($_->title =~ m/$search_string/g) {
            $department = $_;
            last
        }
    }
    return $department->id;
}


# emailqueue_collection
sub get_email_queue_by_id {
    my $self = shift;
    my $mail_queue_id = shift;

    my $mail_queue;
    foreach ($self->emailqueue_collection) {
        if ($_->id == $mail_queue_id) {
            $mail_queue = $_;
            last;
        }

    }
    return $mail_queue->email;
}

# search by NAME to get staff group ID
sub get_email_queue_by_department_id {
    my $self = shift;  
    my $mail_queue_id = shift;

    my $mail_queue;
    foreach ($self->emailqueue_collection) {
        if ($_->departmentid == $mail_queue_id) {
            $mail_queue = $_; 
            last;
        }

    }
    return $mail_queue->email;
}

sub get_email_queue_by_department_name {
    my $self = shift;
    my $department_name = shift;

    $self->get_email_queue_by_department_id($self->get_department_id($department_name));
}

sub get_ticket_priority_name {
    my $self = shift;
    my $priority_id = shift;

    foreach($self->ticketpriority_collection) {
        return $_->title if $_->id == $priority_id;
    }
}

sub get_ticket_priority_id {
    my $self = shift;
    my $search_string = shift;

    foreach ($self->ticketpriority_collection) {
        return $_->id if $_->title =~ m/$search_string/g;
    }
}

sub get_ticket_status_name {
    my $self = shift;
    my $status_id = shift;

    foreach($self->ticketstatus_collection) {
        return $_->title if $_->id == $status_id;
    }
}

sub get_ticket_status_id {
    my $self = shift;
    my $search_string = shift;

    foreach ($self->ticketstatus_collection) {
        return $_->id if $_->title =~ m/$search_string/g;
    }
}

sub get_ticket_type_name {
    my $self = shift;
    my $type_id = shift;

    foreach($self->tickettype_collection) {
        return $_->title if $_->id == $type_id;
    }
}

sub get_ticket_type_id {
    my $self = shift;
    my $search_string = shift;

    foreach ($self->tickettype_collection) {
        return $_->id if $_->title =~ m/$search_string/g;
    }
}




no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Kayako3::Staff
__END__

