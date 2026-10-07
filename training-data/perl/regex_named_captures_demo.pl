use strict;
use warnings;

my $log = "2024-03-15 ERROR: disk full";
if ($log =~ /^(?<date>\d{4}-\d{2}-\d{2})\s+(?<level>[A-Z]+):\s+(?<message>.+)$/) {
    print "date: $+{date}\n";
    print "level: $+{level}\n";
    print "message: $+{message}\n";
}

my $html = "<b>bold</b> and <i>italic</i>";
my @tags = $html =~ /<(\w+)>.*?<\/\1>/g;
print "tags: @tags\n";

my $price = "cost: 42 dollars";
my ($amount) = $price =~ /(?<=cost:\s)(\d+)(?=\sdollars)/;
print "amount: $amount\n";
