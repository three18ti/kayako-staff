package Kayako3::Staff::Template::NewTicket;
use 5.010;

use Moose;

sub _build_template {
    my $self = shift;

my $template =<<'END_TEMPLATE';
[%- USE assert -%]
<?xml version="1.0" encoding="UTF-8"?>
<kayako_staffapi>
    <create staffapiid="[%- staffapiid -%]">

        <!-- Begin Creator Properties -->
        <fullname>[%- user.fullname -%]</fullname>
        <email>[%- assert.user.email -%]</email>
        <creator>staff</creator>
        <userid>0</userid>
        <staffid>[%- user.id -%]</staffid>

        <!-- Begin Ticket Properties -->
        <subject>[%- assert.ticket.subject -%]</subject>
        <departmentid<[%- assert.ticket.departmentid -%]</departmentid>
        <ticketstatusid>[%- ticket.statusid -%]</ticketstatusid>
        <ticketpriorityid>[%- ticket.priorityid -%]</ticketpriorityid>
        <tickettypeid>[%- ticket.typeid -%]</tickettypeid>
        <ownerstaffid>[%- ticket.ownerstaffid -%]</ownerstaffid>
        <emailqueueid>[%- ticket.emailqueueid -%]</emailqueueid>

        

    </create>
</kayako_staffapi>
END_TEMPLATE
    return $template;    
}


no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Kayako3::Staff::Template::NewTicket
__END__

