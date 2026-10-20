use strict;
use warnings;

# Schwartzian transform: decorate, sort, undecorate to avoid recomputing the key.
my @files = qw(report10.txt report2.txt report1.txt notes.txt);
my @sorted = map  { $_->[0] }
             sort { $a->[1] <=> $b->[1] or $a->[0] cmp $b->[0] }
             map  { [ $_, /(\d+)/ ? $1 : 0 ] } @files;
print "@sorted\n";
