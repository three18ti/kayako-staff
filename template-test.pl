#!/usr/bin/perl

use lib './lib';

use strict;
use warnings;

use Kayako3::Staff::Template::NewTicket;
use Template;

my $data = {
    ticket => {
        subject         => "test",
        departmentid    => '1',
        statusid        => '2',
        priorityid      => '3',
        typeid          => '4',
        ownerstaffid    => '5',
        emailqueueid    => '6',
        to              => 'foo@bar.com',
    },
    staff => {
        id              => "1234567",
        fullname        => "Bob Something",
    },
};

my $cfg = Kayako3::Staff::Template::NewTicket->new;
my $tt = Template->new;

my $template = $cfg->_build_template($data);

#open my $OUT, '>', \my $fh;
#$tt->process(\$template, $data, $OUT) || $tt->error;
#close $OUT;


print $template;
