use strict;
use warnings;

package Counter;
sub TIESCALAR { my ($class, $start) = @_; my $v = $start; return bless \$v, $class }
sub FETCH     { my $self = shift; return $$self++ }
sub STORE     { my ($self, $v) = @_; $$self = $v }

package UpperHash;
sub TIEHASH  { return bless {}, shift }
sub STORE    { $_[0]{ uc $_[1] } = $_[2] }
sub FETCH    { $_[0]{ uc $_[1] } }
sub EXISTS   { exists $_[0]{ uc $_[1] } }
sub DELETE   { delete $_[0]{ uc $_[1] } }
sub FIRSTKEY { my @k = sort keys %{ $_[0] }; $k[0] }
sub NEXTKEY  { my @k = sort keys %{ $_[0] }; for my $i (0 .. $#k) { return $k[$i + 1] if $k[$i] eq $_[1] } return }

package main;

tie my $n, 'Counter', 5;
print "$n $n $n\n";
$n = 100;
print "$n $n\n";

tie my %h, 'UpperHash';
$h{apple} = 1;
$h{Banana} = 2;
print "APPLE: $h{apple}\n";
print "keys: ", join(",", keys %h), "\n";
print exists $h{BANANA} ? "banana exists\n" : "no banana\n";
