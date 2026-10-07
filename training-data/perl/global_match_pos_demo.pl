use strict;
use warnings;

my $text = "cat bat rat mat";
my @all = $text =~ /\b(\w)at\b/g;
print "first letters: @all\n";

while ($text =~ /(\w+)/g) {
    printf "word '%s' ends at %d\n", $1, pos($text);
}

my $count = () = $text =~ /at/g;
print "occurrences of 'at': $count\n";

(my $copy = $text) =~ s/(\w+)/\u$1/g;
print "$copy\n";

my $swapped = $text =~ s/(\w)at/at$1/gr;
print "$swapped\n";
