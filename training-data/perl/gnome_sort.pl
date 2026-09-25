use strict;
use warnings;

sub gnome_sort {
    my @a = @_;
    my $i = 0;
    while ($i < @a) {
        if ($i == 0 || $a[$i - 1] <= $a[$i]) { $i++ }
        else { @a[$i - 1, $i] = @a[$i, $i - 1]; $i-- }
    }
    return @a;
}

print join(' ', gnome_sort(34, 2, 10, -9, 7, 7, 0)), "\n";
print join(' ', gnome_sort()), "|empty ok\n";
