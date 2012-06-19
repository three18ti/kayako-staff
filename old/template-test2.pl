#!/usr/bin/perl
package Test;

use Moose;

sub get_template {

my $var =<<'END_TEMPLATE';
League Standings

League Name: [% name %]
Season     : [% season %]

Teams:
[% FOREACH team = teams -%]
[% team.name %] [% team.played -%]
    [% team.won %] [% team.drawn %] [% team.lost %]
[% END %]
END_TEMPLATE
}


package main;

use lib './lib';

use strict;
use warnings;

use Template;

my @teams = (    { name   => 'Man Utd',
                   played => 16,
                   won    => 12,
                   drawn  => 3,
                   lost   => 1 },

                 { name   => 'Bradford',
                   played => 16,
                   won    => 2,
                   drawn  => 5,
                   lost   => 9 });

my %data = (       name   => 'English Premier League',
                   season => '2000/01',);
#                   teams  => \@teams );
use Data::Dumper;
print Dumper %data;
my $cfg = Test->new;
my $tt = Template->new;

my $template = $cfg->get_template();

print $tt->process(\$template, \%data);
