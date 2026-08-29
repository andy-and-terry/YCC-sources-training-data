use strict;
use warnings;

sub two_sum {
    my ($nums, $target) = @_;
    my %seen;
    for my $i (0 .. $#$nums) {
        my $complement = $target - $nums->[$i];
        if (exists $seen{$complement}) {
            return ($seen{$complement}, $i);
        }
        $seen{$nums->[$i]} = $i;
    }
    return ();
}

my @result = two_sum([2, 7, 11, 15], 9);
print "@result\n";
