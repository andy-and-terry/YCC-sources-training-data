use strict; use warnings;
my $d = "2026-11-02";
if ($d =~ /^(?<y>\d{4})-(?<m>\d\d)-(?<d>\d\d)$/) {
    print "$+{y}/$+{m}/$+{d}\n";
}
