use strict;
use warnings;

my $buffer = "";
open(my $out, '>', \$buffer) or die $!;
print $out "first\n";
printf $out "%s=%d\n", "answer", 42;
close $out;
print "captured:\n$buffer";

my $input = "alpha\nbeta\ngamma\n";
open(my $in, '<', \$input) or die $!;
my @lines = <$in>;
close $in;
chomp @lines;
print scalar(@lines), " lines, last is $lines[-1]\n";

open($in, '<', \$input) or die $!;
local $/ = undef;
my $all = <$in>;
print length($all), " chars slurped\n";
