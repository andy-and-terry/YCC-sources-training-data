use strict; use warnings;
my $line = "2024-03-15 ERROR disk full";
if ($line =~ /^(?<y>\d{4})-(?<m>\d\d)-(?<d>\d\d)\s+(?<lvl>\w+)\s+(?<msg>.*)$/) {
    print "$+{lvl} on $+{d}/$+{m}/$+{y}: $+{msg}\n";
}
(my $t = "a  b   c") =~ s/\s+/ /g;
print "$t\n";
