use strict;
use warnings;

# Ring-buffer deque that grows by doubling.
package Deque;

sub new { bless { buf => [(undef) x 4], head => 0, size => 0 }, shift }
sub size { $_[0]{size} }
sub _cap { scalar @{ $_[0]{buf} } }
sub _idx { my ($s, $i) = @_; ($s->{head} + $i) % $s->_cap }

sub _grow {
    my $s = shift;
    return if $s->{size} < $s->_cap;
    my @items = map { $s->{buf}[ $s->_idx($_) ] } 0 .. $s->{size} - 1;
    $s->{buf} = [@items, (undef) x @items];
    $s->{head} = 0;
}

sub push_back  { my ($s, $v) = @_; $s->_grow; $s->{buf}[ $s->_idx($s->{size}++) ] = $v; $s }
sub push_front { my ($s, $v) = @_; $s->_grow; $s->{head} = ($s->{head} - 1) % $s->_cap; $s->{buf}[ $s->{head} ] = $v; $s->{size}++; $s }

sub pop_front {
    my $s = shift;
    die "empty deque\n" unless $s->{size};
    my $v = $s->{buf}[ $s->{head} ];
    $s->{head} = $s->_idx(1);
    $s->{size}--;
    return $v;
}

sub pop_back {
    my $s = shift;
    die "empty deque\n" unless $s->{size};
    return $s->{buf}[ $s->_idx(--$s->{size}) ];
}

sub to_list { my $s = shift; map { $s->{buf}[ $s->_idx($_) ] } 0 .. $s->{size} - 1 }

package main;

my $d = Deque->new;
$d->push_back($_) for 1 .. 5;
$d->push_front($_) for 0, -1;
print join(' ', $d->to_list), "\n";
print 'pop_front=', $d->pop_front, ' pop_back=', $d->pop_back, "\n";
print join(' ', $d->to_list), ' size=', $d->size, "\n";
eval { Deque->new->pop_back } or print "error: $@";
