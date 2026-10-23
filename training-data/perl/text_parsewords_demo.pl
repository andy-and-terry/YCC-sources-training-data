use strict;
use warnings;
use Text::ParseWords qw(shellwords quotewords parse_line);

# shellwords splits like a shell: quotes group words, backslashes escape
my $cmd = q{copy "my file.txt" 'other dir/target' plain\ word};
my @args = shellwords($cmd);
printf "%d args:\n", scalar @args;
print "  [$_]\n" for @args;

# quotewords splits on an arbitrary delimiter; keep=0 strips the quotes
my $csv = q{alice,"Smith, Jane",42,"says ""hi"""};
my @fields = quotewords(',', 0, $csv);
print join(" | ", @fields), "\n";

# keep=1 preserves the quoting characters
my @kept = quotewords(',', 1, q{a,"b,c",d});
print join(" | ", @kept), "\n";

# parse_line works on a single line with a regex delimiter
my @cols = parse_line('\s*;\s*', 0, q{one ; "two ; three" ;four});
print scalar(@cols), " columns: ", join("/", @cols), "\n";
