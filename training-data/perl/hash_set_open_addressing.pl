use strict;
use warnings;

# Hash set with linear probing and tombstones.
package OpenHashSet;

my $TOMB = \'tombstone';

sub new { bless { slots => [(undef) x 8], size => 0, used => 0 }, shift }

sub _hash {    # FNV-1a (32-bit)
    my $h = 2166136261;
    $h = (($h ^ ord) * 16777619) & 0xFFFFFFFF for split //, shift;
    return $h;
}

sub _find {
    my ($s, $key) = @_;
    my $cap = @{ $s->{slots} };
    my $i = _hash($key) % $cap;
    my $first_tomb;
    while (defined(my $v = $s->{slots}[$i])) {
        if (ref $v && $v == $TOMB) { $first_tomb //= $i }
        elsif ($v eq $key) { return ($i, 1) }
        $i = ($i + 1) % $cap;
    }
    return ($first_tomb // $i, 0);
}

sub add {
    my ($s, $key) = @_;
    $s->_resize if ($s->{used} + 1) * 4 > @{ $s->{slots} } * 3;
    my ($i, $found) = $s->_find($key);
    return 0 if $found;
    $s->{used}++ unless defined $s->{slots}[$i];
    $s->{slots}[$i] = $key;
    $s->{size}++;
    return 1;
}

sub contains { ($_[0]->_find($_[1]))[1] }

sub remove {
    my ($s, $key) = @_;
    my ($i, $found) = $s->_find($key);
    return 0 unless $found;
    $s->{slots}[$i] = $TOMB;
    $s->{size}--;
    return 1;
}

sub _resize {
    my $s = shift;
    my @keys = $s->keys;
    @$s{qw(slots size used)} = ([(undef) x (2 * @{ $s->{slots} })], 0, 0);
    $s->add($_) for @keys;
}

sub keys { grep { defined && !ref } @{ $_[0]{slots} } }
sub size { $_[0]{size} }

package main;

my $set = OpenHashSet->new;
$set->add($_) for qw(apple banana cherry date elderberry fig grape apple);
$set->remove('banana');
printf "size=%d contains(cherry)=%d contains(banana)=%d capacity=%d\n",
    $set->size, $set->contains('cherry'), $set->contains('banana'), scalar @{ $set->{slots} };
print join(' ', sort $set->keys), "\n";
