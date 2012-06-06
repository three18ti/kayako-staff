#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Kayako3::Staff' ) || print "Bail out!\n";
}

diag( "Testing Kayako3::Staff $Kayako3::Staff::VERSION, Perl $], $^X" );
