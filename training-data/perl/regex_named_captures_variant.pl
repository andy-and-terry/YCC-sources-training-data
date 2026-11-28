use strict; use warnings;

my $line = "2024-03-15 ERROR disk full";
if ($line =~ /^(?<date>\d{4}-\d\d-\d\d)\s+(?<lvl>\w+)\s+(?<msg>.+)$/) {
    print "$+{lvl} on $+{date}: $+{msg}\n";
}
