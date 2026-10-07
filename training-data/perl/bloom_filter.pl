use strict;
use warnings;

my $size = 64;
my @bits = (0) x $size;

sub hash1 {
    my ($s) = @_;
    my $h = 0;
    $h = ($h * 31 + ord($_)) % $size for split //, $s;
    return $h;
}

sub hash2 {
    my ($s) = @_;
    my $h = 0;
    $h = ($h * 17 + ord($_) + 7) % $size for split //, $s;
    return $h;
}

sub add_item {
    my ($s) = @_;
    $bits[hash1($s)] = 1;
    $bits[hash2($s)] = 1;
}

sub might_contain {
    my ($s) = @_;
    return $bits[hash1($s)] && $bits[hash2($s)];
}

add_item("apple");
add_item("banana");
print might_contain("apple") ? "1\n" : "0\n";
print might_contain("cherry") ? "1\n" : "0\n";
