use strict;
use warnings;

my $s = "2024-03-15 ERROR disk full";
if ($s =~ /^(?<y>\d{4})-(?<m>\d\d)-(?<d>\d\d)\s+(?<lvl>\w+)/) {
    print "$+{y}/$+{m}/$+{d} $+{lvl}\n";
}
(my $t = "hello world") =~ tr/a-z/A-Z/;
print "$t\n";
my $vowels = ($s =~ tr/aeiou//);
print "$vowels\n";
my $str = "a1b22c333";
my @nums = $str =~ /(\d+)/g;
print "@nums\n";
(my $r = $str) =~ s/(\d+)/<$1>/g;
print "$r\n";
my $e = "3+4" =~ s/(\d)\+(\d)/$1+$2/er;
print "$e\n";
print join("|", split /\s*,\s*/, "a , b,c ,d"), "\n";
