package Kayako3::Staff::Response::LoadTicket::Post;
use Moose;
use namespace::autoclean;
use XML::Toolkit;

has 'contents_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Contents]',
     is          => 'ro',     init_arg    => 'contentss',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_contents => ['push'] },     description => {
        LocalName => "contents",
        Prefix => "",
        node_type => "child",
        Name => "contents",
        NamespaceURI => "",
        sort_order => 0,
     },
);
has 'creationmode_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Creationmode]',
     is          => 'ro',     init_arg    => 'creationmodes',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_creationmode => ['push'] },     description => {
        LocalName => "creationmode",
        Prefix => "",
        node_type => "child",
        Name => "creationmode",
        NamespaceURI => "",
        sort_order => 1,
     },
);
has 'creationtime_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Creationtime]',
     is          => 'ro',     init_arg    => 'creationtimes',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_creationtime => ['push'] },     description => {
        LocalName => "creationtime",
        Prefix => "",
        node_type => "child",
        Name => "creationtime",
        NamespaceURI => "",
        sort_order => 2,
     },
);
has 'creator_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Creator]',
     is          => 'ro',     init_arg    => 'creators',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_creator => ['push'] },     description => {
        LocalName => "creator",
        Prefix => "",
        node_type => "child",
        Name => "creator",
        NamespaceURI => "",
        sort_order => 3,
     },
);
has 'editinfo_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Editinfo]',
     is          => 'ro',     init_arg    => 'editinfos',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_editinfo => ['push'] },     description => {
        LocalName => "editinfo",
        Prefix => "",
        node_type => "child",
        Name => "editinfo",
        NamespaceURI => "",
        sort_order => 4,
     },
);
has 'email_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Email]',
     is          => 'ro',     init_arg    => 'emails',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_email => ['push'] },     description => {
        LocalName => "email",
        Prefix => "",
        node_type => "child",
        Name => "email",
        NamespaceURI => "",
        sort_order => 5,
     },
);
has 'emailto_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Emailto]',
     is          => 'ro',     init_arg    => 'emailtos',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_emailto => ['push'] },     description => {
        LocalName => "emailto",
        Prefix => "",
        node_type => "child",
        Name => "emailto",
        NamespaceURI => "",
        sort_order => 6,
     },
);
has 'fullname_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Fullname]',
     is          => 'ro',     init_arg    => 'fullnames',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_fullname => ['push'] },     description => {
        LocalName => "fullname",
        Prefix => "",
        node_type => "child",
        Name => "fullname",
        NamespaceURI => "",
        sort_order => 7,
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
        sort_order => 8,
     },
);
has 'ipaddress_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Ipaddress]',
     is          => 'ro',     init_arg    => 'ipaddresss',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_ipaddress => ['push'] },     description => {
        LocalName => "ipaddress",
        Prefix => "",
        node_type => "child",
        Name => "ipaddress",
        NamespaceURI => "",
        sort_order => 9,
     },
);
has 'issurveycomment_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Issurveycomment]',
     is          => 'ro',     init_arg    => 'issurveycomments',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_issurveycomment => ['push'] },     description => {
        LocalName => "issurveycomment",
        Prefix => "",
        node_type => "child",
        Name => "issurveycomment",
        NamespaceURI => "",
        sort_order => 10,
     },
);
has 'staffid_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Staffid]',
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
        sort_order => 11,
     },
);
has 'subject_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Subject]',
     is          => 'ro',     init_arg    => 'subjects',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_subject => ['push'] },     description => {
        LocalName => "subject",
        Prefix => "",
        node_type => "child",
        Name => "subject",
        NamespaceURI => "",
        sort_order => 12,
     },
);
has 'userid_collection' => (
     isa         => 'ArrayRef[Kayako3::Staff::Response::LoadTicket::Userid]',
     is          => 'ro',     init_arg    => 'userids',
     traits      => [qw(XML Array)],
     lazy        => 1,
     auto_deref  => 1,
     default     => sub { [] },
     handles    => { add_userid => ['push'] },     description => {
        LocalName => "userid",
        Prefix => "",
        node_type => "child",
        Name => "userid",
        NamespaceURI => "",
        sort_order => 13,
     },
);
1;

__END__
