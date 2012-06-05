package Kayako3::Staff;
use 5.010;

use strict;
use warnings;

use HTTP::Cookies;
use LWP::UserAgent;
use IO::Uncompress::Gunzip qw(gunzip $GunzipError) ;
use XML::Toolkit::App;
use Moose;
use Carp;

=head1 NAME

Kayako3::Staff - Interface for Kayako API



1;
