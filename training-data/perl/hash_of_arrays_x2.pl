use strict; use warnings;
my %h;
push @{ $h{ length $_ } }, $_ for qw(a bb cc d eee);
print "$_: @{ $h{$_} }\n" for sort keys %h;
