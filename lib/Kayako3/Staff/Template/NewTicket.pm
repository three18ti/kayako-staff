package Kayako3::Staff::Template::NewTicket;
use 5.010;

use Moose;

sub _build_template {
    my $self = shift;

my $template =<<'END_TEMPLATE';
[%- USE assert -%]
<kayako_staffapi>
    <create staffapiid="[%- staffapiid -%]">

        <!-- Begin User Properties -->
        <fullname>[%- user.fullname -%]</fullname>
        <email>[%- user.assert.from -%]</email>

        <!-- Begin Ticket Properties -->
        <subject>[%- ticket.assert.subject -%]</subject>
        <departmentid>...</departmentid>
        <ticketstatusid>...</ticketstatusid>
        <ticketpriorityid>...</ticketpriorityid>
        <tickettypeid>...</tickettypeid>
        <ownerstaffid>...</ownerstaffid>
        <emailqueueid>...</emailqueueid>




</kayako_staffapi>
END_TEMPLATE
}


no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Kayako3::Staff::Template::NewTicket
__END__

