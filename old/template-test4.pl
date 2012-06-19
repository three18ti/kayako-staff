#!/usr/bin/perl
package Test;
use Moose;

sub get_template {
my $template =<<'END_TEMPLATE';
<kayako_staffapi>
    <create staffapiid="[%- staffapiid -%]">
        <!-- Begin Creator Properties -->
        <fullname>[%- user.fullname -%]</fullname>

        <!-- Begin Ticket Properties -->
        <subject>[%- ticket.subject -%]</subject>

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
    user => {
        fullname        => "bob",
    },
    ticket => {
        subject         => "test",
    },
);


print Dumper %data;

my $cfg = Test->new;
my $tt = Template->new;

my $template = $cfg->get_template();

print $tt->process(\$template, \%data);
