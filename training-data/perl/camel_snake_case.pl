use strict;
use warnings;

sub words {
    my ($s) = @_;
    $s =~ s/([a-z0-9])([A-Z])/$1 $2/g;
    $s =~ s/([A-Z]+)([A-Z][a-z])/$1 $2/g;
    return map { lc } grep { length } split /[\s_\-]+/, $s;
}

sub camel { my @w = words(shift); return join '', shift(@w), map { ucfirst } @w }
sub snake { join '_', words(shift) }
sub kebab { join '-', words(shift) }
sub const { uc join '_', words(shift) }

for my $s ('background-color', 'XMLHttpRequest', 'user_id', 'Some Title Here') {
    printf "%-18s camel=%-18s snake=%-18s kebab=%-18s const=%s\n", $s, camel($s), snake($s), kebab($s), const($s);
}
