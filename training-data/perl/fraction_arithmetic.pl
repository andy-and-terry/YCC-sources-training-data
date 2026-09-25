use strict;
use warnings;

package Fraction;
use overload
    '+' => sub { my ($a, $b) = map { Fraction::lift($_) } @_[0, 1]; Fraction->new($a->{n} * $b->{d} + $b->{n} * $a->{d}, $a->{d} * $b->{d}) },
    '-' => sub { my ($a, $b) = map { Fraction::lift($_) } @_[0, 1]; ($a, $b) = ($b, $a) if $_[2]; Fraction->new($a->{n} * $b->{d} - $b->{n} * $a->{d}, $a->{d} * $b->{d}) },
    '*' => sub { my ($a, $b) = map { Fraction::lift($_) } @_[0, 1]; Fraction->new($a->{n} * $b->{n}, $a->{d} * $b->{d}) },
    '/' => sub { my ($a, $b) = map { Fraction::lift($_) } @_[0, 1]; ($a, $b) = ($b, $a) if $_[2]; Fraction->new($a->{n} * $b->{d}, $a->{d} * $b->{n}) },
    '<=>' => sub { my ($a, $b) = map { Fraction::lift($_) } @_[0, 1]; my $c = $a->{n} * $b->{d} <=> $b->{n} * $a->{d}; $_[2] ? -$c : $c },
    '""' => sub { $_[0]{d} == 1 ? "$_[0]{n}" : "$_[0]{n}/$_[0]{d}" };

sub gcd { my ($a, $b) = map { abs } @_; ($a, $b) = ($b, $a % $b) while $b; $a }

sub new {
    my ($class, $n, $d) = @_;
    $d //= 1;
    die "zero denominator\n" if $d == 0;
    my $g = gcd($n, $d) || 1;
    ($n, $d) = (-$n, -$d) if $d < 0;
    return bless { n => $n / $g, d => $d / $g }, $class;
}

sub lift { ref $_[0] ? $_[0] : Fraction->new($_[0]) }

package main;

my ($p, $q) = (Fraction->new(1, 3), Fraction->new(1, 6));
print join(" ", $p + $q, $p - $q, $p * $q, $p / $q, 1 - $p, ($p <=> $q)), "\n";
my $h = Fraction->new(0);
$h = $h + Fraction->new(1, $_) for 1 .. 20;
print "H(20) = $h\n";
print 'sorted: ', join(' ', sort { $a <=> $b } map { Fraction->new(@$_) } [3, 4], [-1, 2], [5, 8], [2, 3]), "\n";
