use strict;
use warnings;

# Dictionary-of-keys sparse matrix: only non-zero entries are stored.
package SparseMatrix;

sub new { my ($class, $rows, $cols) = @_; bless { rows => $rows, cols => $cols, data => {} }, $class }

sub from_dense {
    my ($class, @m) = @_;
    my $s = $class->new(scalar @m, scalar @{ $m[0] });
    for my $r (0 .. $#m) { $s->set($r, $_, $m[$r][$_]) for 0 .. $#{ $m[$r] } }
    return $s;
}

sub set {
    my ($s, $r, $c, $v) = @_;
    if ($v == 0) { delete $s->{data}{$r}{$c}; delete $s->{data}{$r} unless %{ $s->{data}{$r} } }
    else         { $s->{data}{$r}{$c} = $v }
}

sub get { my ($s, $r, $c) = @_; exists $s->{data}{$r} ? $s->{data}{$r}{$c} // 0 : 0 }

sub nnz { my $s = shift; my $n = 0; $n += keys %$_ for values %{ $s->{data} }; $n }

sub multiply {
    my ($a, $b) = @_;
    die "dimension mismatch\n" unless $a->{cols} == $b->{rows};
    my $res = SparseMatrix->new($a->{rows}, $b->{cols});
    while (my ($r, $row) = each %{ $a->{data} }) {
        while (my ($k, $av) = each %$row) {
            my $brow = $b->{data}{$k} or next;
            $res->set($r, $_, $res->get($r, $_) + $av * $brow->{$_}) for keys %$brow;
        }
    }
    return $res;
}

sub to_dense {
    my $s = shift;
    return map { my $r = $_; [map { $s->get($r, $_) } 0 .. $s->{cols} - 1] } 0 .. $s->{rows} - 1;
}

package main;

my $a = SparseMatrix->from_dense([1, 0, 0], [0, 0, 2], [0, 3, 0]);
my $b = SparseMatrix->from_dense([0, 4], [5, 0], [0, 6]);
my $p = $a->multiply($b);
printf "nnz(a)=%d nnz(p)=%d\n", $a->nnz, $p->nnz;
print join(' | ', map { "@$_" } $p->to_dense), "\n";
