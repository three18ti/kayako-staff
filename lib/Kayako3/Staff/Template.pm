package Kayako3::Staff::Template;

use v5.14.2;
use Moose;

use Template;

sub _build_template {
    my $self = shift;
    my $params = shift;

    my $tt = Template->new;

    my $template = $self->_get_template;

    open my $DATA, '>', \my $template_fh;

    $tt->process(\$template, $params, $DATA) || return $tt->error;

    close $DATA;

    return $template_fh || $tt->error;
}

no Moose;
__PACKAGE__->meta->make_immutable;
1; # end Kayako3::Staff::Template;
__END__


