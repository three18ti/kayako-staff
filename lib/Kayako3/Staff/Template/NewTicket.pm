package Kayako3::Staff::Template::NewTicket;
use 5.010;

use Moose;

sub _build_template {
    my $self = shift;

my $template =<<'END_TEMPLATE';
[%- USE assert -%]
<?xml version="1.0" encoding="UTF-8"?>
<kayako_staffapi>
    <create staffapiid="[%- staff.apiid -%]">

        [%- # Begin Staff Identification -%]
        <fullname>[%- staff.fullname -%]</fullname>
        <creator>staff</creator>
        <staffid>[%- staff.id -%]</staffid>

        [%- # Begin Ticket Recipients 0%]
        <email>[%- assert.ticket.to -%]</email>
        <ccto>[%- ticket.ccto -%]</ccto>
        <bccto>[%- ticket.bccto -%]</bccto>

        [%- # Begin Ticket Properties -%]
        <departmentid>[%- assert.ticket.departmentid -%]</departmentid>
        <tickettypeid>[%- assertticket.typeid -%]</tickettypeid>
        <ownerstaffid>[%- staff.id -%]</ownerstaffid>
        <emailqueueid>[%- assert.ticket.emailqueueid -%]</emailqueueid>
        <ticketstatusid>[%- assert.ticket.statusid -%]</ticketstatusid>
        <ticketpriorityid>[%- assert.ticket.priorityid -%]</ticketpriorityid>
        <sendautoresponder>    
            [%- IF ticket.autoresponder -%]
                ticket.autoresponder
            [%- ELSE -%]
                0
            [%- END -%]
        </sendautoresponder>

        [%- # Begin Ticket info -%]
        <subject>[%- assert.ticket.subject -%]</subject>
        
        [%- # Begin Ticket Body -%]
        <reply>
            <contents>[%- assert.ticket.body -%]</contents>
            [%- IF ticket.attachment -%]
                <attachment filename="[%- ticket.attachment.filename -%]" md5="[%- ticket.attachment.md5 -%]">
                    [%- ticket.attachment.contents -%]
                </attachment>
            [%- END -%]
        </reply>

        [%- # Begin Ticket Notes -%]
        [%- IF ticket.notes -%]
            <note type="[%- ticket.note.type -%]" notecolor="[%- ticket.note.color -%]">
                [%- ticket.note.contents -%]
            </note>
        [%- END -%]

    </create>
</kayako_staffapi>
END_TEMPLATE
    return $template;    
}


no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Kayako3::Staff::Template::NewTicket
__END__

