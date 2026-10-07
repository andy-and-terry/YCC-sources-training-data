use strict;
use warnings;

# Read inline records from the __DATA__ section.
my %totals;
while (my $line = <DATA>) {
    chomp $line;
    next if $line =~ /^\s*(#|$)/;
    my ($category, $amount) = split /,/, $line;
    $totals{$category} += $amount;
}

printf "%-8s %6.2f\n", $_, $totals{$_} for sort keys %totals;

__DATA__
# category,amount
food,12.50
rent,800
food,7.25
fun,30
