use strict;
use warnings;

my %h = (a => 1, b => 2, c => 3);
my @vals = @h{qw(a c)};
my %sub; @sub{qw(a b)} = @h{qw(a b)};
my %kv = %h{'a', 'b'};
print "@vals ", join(",", map {"$_=$sub{$_}"} sort keys %sub), " ", scalar(keys %kv), "\n";
my $data = { list => [1, 2, { deep => 'x' }], map => { k => [10, 20] } };
print $data->{list}[2]{deep}, $data->{map}{k}->[-1], scalar @{ $data->{list} }, "\n";
push @{ $data->{new} }, 'autoviv';
print exists $data->{new} ? "yes\n" : "no\n";
