use strict;
use warnings;

my $log = "2024-03-01 ERROR disk full; 2024-03-02 WARN low mem; 2024-03-05 ERROR net down";

# Named captures and global matching in list context.
while ($log =~ /(?<date>\d{4}-\d\d-\d\d) (?<level>ERROR|WARN)/g) {
    print "$+{date} => $+{level}\n";
}
my @errors = $log =~ /(\d{4}-\d\d-\d\d) ERROR/g;
print scalar(@errors), " errors: @errors\n";

(my $copy = $log) =~ s/(\d{4})-(\d\d)-(\d\d)/$3\/$2\/$1/g;
print substr($copy, 0, 30), "\n";
