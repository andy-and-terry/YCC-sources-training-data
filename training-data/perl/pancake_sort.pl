use strict;
use warnings;

sub pancake_sort {
    my @a = @_;
    my @flips;
    for (my $size = @a; $size > 1; $size--) {
        my $max = 0;
        $a[$_] > $a[$max] and $max = $_ for 1 .. $size - 1;
        next if $max == $size - 1;
        if ($max > 0) { @a[0 .. $max] = reverse @a[0 .. $max]; push @flips, $max + 1 }
        @a[0 .. $size - 1] = reverse @a[0 .. $size - 1];
        push @flips, $size;
    }
    return (\@a, @flips);
}

my ($sorted, @flips) = pancake_sort(3, 6, 1, 9, 4, 2);
print "@$sorted | flips: ", join(',', @flips), "\n";
