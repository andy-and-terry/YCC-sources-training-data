use strict;
use warnings;

sub make_counter {
    my ($start) = @_;
    my $count = $start;
    return sub { return $count++; };
}

my $counter_a = make_counter(0);
my $counter_b = make_counter(100);

print $counter_a->(), "\n";
print $counter_a->(), "\n";
print $counter_b->(), "\n";
print $counter_a->(), "\n";
print $counter_b->(), "\n";
