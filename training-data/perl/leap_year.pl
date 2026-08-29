use strict;
use warnings;

sub is_leap_year {
    my $year = shift;
    return (($year % 4 == 0 && $year % 100 != 0) || $year % 400 == 0);
}

print is_leap_year(2000) ? "1" : "0", "\n";
print is_leap_year(1900) ? "1" : "0", "\n";
print is_leap_year(2024) ? "1" : "0", "\n";
