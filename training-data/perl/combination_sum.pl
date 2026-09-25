use strict;
use warnings;

sub combination_sum {
    my ($cands, $target) = @_;
    my @c = sort { $a <=> $b } @$cands;
    my @out;
    my $go;
    $go = sub {
        my ($start, $remain, @path) = @_;
        if ($remain == 0) { push @out, [@path]; return }
        for my $i ($start .. $#c) {
            last if $c[$i] > $remain;
            $go->($i, $remain - $c[$i], @path, $c[$i]);
        }
    };
    $go->(0, $target);
    return @out;
}

print join(' ', map { '[' . join(',', @$_) . ']' } combination_sum([2, 3, 6, 7], 7)), "\n";
print join(' ', map { '[' . join(',', @$_) . ']' } combination_sum([2, 3, 5], 8)), "\n";
