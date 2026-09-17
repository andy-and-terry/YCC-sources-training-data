use strict;
use warnings;
use File::Temp qw(tempfile);

my ($fh, $filename) = tempfile();
print $fh "apple\nbanana\ncherry\n";
close $fh;

open(my $in, '<', $filename) or die "cannot open $filename: $!";
my @lines = <$in>;
close $in;

chomp @lines;
print "line count: ", scalar(@lines), "\n";
for my $line (@lines) {
    print "read: $line\n";
}

unlink $filename;
