use strict; use warnings;
my $s = "2026-11-05 and 2025-01-31";
while ($s =~ /(?<y>\d{4})-(?<m>\d\d)-(?<d>\d\d)/g) {
    print "$+{y}/$+{m}/$+{d}\n";
}
(my $t = $s) =~ s/(\d+)/<$1>/g;
print "$t\n";
