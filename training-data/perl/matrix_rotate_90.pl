use strict;
use warnings;

sub transpose { my @m = @_; map { my $c = $_; [map { $_->[$c] } @m] } 0 .. $#{ $m[0] } }
sub rotate_cw  { map { [reverse @$_] } transpose(@_) }
sub rotate_ccw { reverse transpose(@_) }

sub rotate_in_place {    # square matrix, layer by layer
    my $m = shift;
    my $n = @$m;
    for my $layer (0 .. int($n / 2) - 1) {
        my $last = $n - 1 - $layer;
        for my $i ($layer .. $last - 1) {
            my $off = $i - $layer;
            my $top = $m->[$layer][$i];
            $m->[$layer][$i]          = $m->[$last - $off][$layer];
            $m->[$last - $off][$layer] = $m->[$last][$last - $off];
            $m->[$last][$last - $off]  = $m->[$i][$last];
            $m->[$i][$last]            = $top;
        }
    }
}

my @m = ([1, 2, 3], [4, 5, 6], [7, 8, 9]);
print join(' | ', map { "@$_" } rotate_cw(@m)), "\n";
print join(' | ', map { "@$_" } rotate_ccw(@m)), "\n";
my @sq = map { [map { $_ } ($_ * 4 + 1) .. ($_ * 4 + 4)] } 0 .. 3;
rotate_in_place(\@sq);
print join(' | ', map { "@$_" } @sq), "\n";
