use strict;
use warnings;
use POSIX qw(floor ceil fmod strtol INT_MAX);

# int() truncates toward zero; floor and ceil go toward -inf / +inf.
for my $n (2.7, -2.7, 5, -0.5) {
    printf "%5.1f  int=%2d  floor=%2d  ceil=%2d  round=%2d\n",
        $n, int($n), floor($n), ceil($n), floor($n + 0.5);
}

# fmod keeps the sign of the dividend, unlike Perl's % operator.
printf "fmod(-7, 3) = %g\n", fmod(-7, 3);
printf "-7 %% 3     = %d\n", -7 % 3;

# Integer ceiling division without floating point.
sub ceil_div { my ($a, $b) = @_; return int(($a + $b - 1) / $b) }
printf "pages for 23 items at 10/page: %d\n", ceil_div(23, 10);

# strtol reports how many characters were left unparsed.
my ($num, $unparsed) = strtol("0x1fZZ", 16);
print "parsed $num, unparsed $unparsed\n";
print "INT_MAX is ", INT_MAX, "\n";
