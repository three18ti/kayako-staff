#!/usr/bin/perl
package Test;
use Moose;

sub get_template {
my $template =<<'END_TEMPLATE';
[%- USE assert -%]
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
}

package main;
use strict;
use warnings;

use Template;
use Data::Dumper;

my %data = (
    staffapiid          => "1234",
    ticket => {
        subject         => "test",
        departmentid    => '1',
        statusid        => '2',
        priorityid      => '3',
        typeid          => '4',
        ownerstaffid    => '5',
        emailqueueid    => '6',
    },
    user => {
        id              => "1234567",
        fullname        => "Bob Something",
        email           => 'foo@bar.com',
    },
);


print Dumper %data;

my $cfg = Test->new;
my $tt = Template->new;

my $template = $cfg->get_template();

print $tt->process(\$template, \%data) || $tt->error;
