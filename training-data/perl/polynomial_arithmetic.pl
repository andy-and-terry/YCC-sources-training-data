use strict;
use warnings;

# Coefficients stored lowest degree first.
package Polynomial;
use overload '+' => \&add, '*' => \&mul, '""' => \&str;

sub new {
    my ($class, @c) = @_;
    pop @c while @c > 1 && $c[-1] == 0;
    return bless { c => @c ? \@c : [0] }, $class;
}

sub add {
    my ($p, $q) = @_;
    my ($a, $b) = ($p->{c}, $q->{c});
    my $n = @$a > @$b ? $#$a : $#$b;
    return Polynomial->new(map { ($a->[$_] // 0) + ($b->[$_] // 0) } 0 .. $n);
}

sub mul {
    my ($p, $q) = @_;
    my @r = (0) x (@{ $p->{c} } + @{ $q->{c} } - 1);
    for my $i (0 .. $#{ $p->{c} }) {
        $r[ $i + $_ ] += $p->{c}[$i] * $q->{c}[$_] for 0 .. $#{ $q->{c} };
    }
    return Polynomial->new(@r);
}

sub evaluate { my ($p, $x) = @_; my $v = 0; $v = $v * $x + $_ for reverse @{ $p->{c} }; $v }
sub derivative { my $p = shift; my @c = @{ $p->{c} }; Polynomial->new(map { $_ * $c[$_] } 1 .. $#c) }

sub str {
    my $p = shift;
    my @c = @{ $p->{c} };
    my @terms;
    for my $i (reverse 0 .. $#c) {
        my $k = $c[$i];
        next if $k == 0 && @c > 1;
        my $coef = $i > 0 && abs $k == 1 ? ($k < 0 ? '-' : '') : $k;
        push @terms, $coef . ($i == 0 ? '' : $i == 1 ? 'x' : "x^$i");
    }
    return join(' + ', @terms) =~ s/\+ -/- /gr;
}

package main;

my $p = Polynomial->new(1, -3, 2);    # 2x^2 - 3x + 1
my $q = Polynomial->new(-1, 1);       # x - 1
print "p = $p\nq = $q\np + q = ", $p + $q, "\np * q = ", $p * $q, "\np' = ", $p->derivative, "\np(3) = ", $p->evaluate(3), "\n";
