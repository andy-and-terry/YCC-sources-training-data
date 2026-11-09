use strict; use warnings;
my %h;
push @{ $h{ length $_ } }, $_ for qw(a bb cc ddd e);
for my $k (sort keys %h) {
    print "$k: @{ $h{$k} }\n";
}
