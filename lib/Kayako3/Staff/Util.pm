package Kayako3::Staff::Util;
use 5.010;
use Moose;

=head1 Utility Methods

These are methods used internally by the application, should never need to be called externally

=over 4

=item _unzip

Unzips the response content

=back

=cut

use IO::Uncompress::Gunzip qw(gunzip $GunzipError) ;
sub _unzip {
    my $self = shift;
    my $input = shift;

    open my $FHIN, '<', \$input;
    open my $FHOUT, '>', \my $xml_response;

    gunzip $FHIN => $FHOUT
        or warn "gunzip failed: $GunzipError\n";

    return $xml_response;
}

=over 4

=item _uri_escape

Performs URI escaping of strings

=back

=cut

use URI::Escape::XS qw/uri_escape/;
sub _uri_escape {
    my $self = shift;
    my $string = shift;

    uri_escape $string;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1; # End of Kayako3::Staff::Util
__END__
