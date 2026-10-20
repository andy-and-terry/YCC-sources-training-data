use strict;
use warnings;

my $s = "The quick brown fox";
print index($s, "quick"), rindex($s, "o"), " ", substr($s, 4, 5), " ", lc(substr($s, 0, 3)), "\n";
substr($s, 0, 3) = "A";
substr($s, -3, 3, "cat");
print "$s\n";
print ucfirst(lc("hELLO")), lcfirst("ABC"), " ", "ab" x 3, " ", join("", reverse split //, "abc"), "\n";
print sprintf("%s", join ",", map { ord } split //, "AZ"), chr(97), "\n";
my $padded = sprintf("%-6s|", "ab"); print "$padded\n";
print "repeat: ", "-" x 10, "\n", length("héllo"), "\n";
