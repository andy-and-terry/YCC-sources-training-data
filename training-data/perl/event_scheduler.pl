use strict;
use warnings;

# Discrete-event scheduler: a binary min-heap ordered by (time, sequence).
package Scheduler;

sub new { bless { heap => [], seq => 0, now => 0 }, shift }

sub _less { my ($x, $y) = @_; $x->[0] <=> $y->[0] || $x->[1] <=> $y->[1] }

sub at {
    my ($s, $time, $name, $cb) = @_;
    my $h = $s->{heap};
    push @$h, [$time, $s->{seq}++, $name, $cb];
    my $i = $#$h;
    while ($i > 0) {
        my $p = ($i - 1) >> 1;
        last if _less($h->[$p], $h->[$i]) <= 0;
        @$h[$p, $i] = @$h[$i, $p];
        $i = $p;
    }
}

sub after { my ($s, $delay, @rest) = @_; $s->at($s->{now} + $delay, @rest) }

sub _pop {
    my $h = shift->{heap};
    my $top = $h->[0];
    my $last = pop @$h;
    if (@$h) {
        $h->[0] = $last;
        my $i = 0;
        while (1) {
            my ($l, $r, $m) = (2 * $i + 1, 2 * $i + 2, $i);
            $m = $l if $l < @$h && _less($h->[$l], $h->[$m]) < 0;
            $m = $r if $r < @$h && _less($h->[$r], $h->[$m]) < 0;
            last if $m == $i;
            @$h[$m, $i] = @$h[$i, $m];
            $i = $m;
        }
    }
    return $top;
}

sub run {
    my ($s, $until) = @_;
    while (@{ $s->{heap} } && $s->{heap}[0][0] <= $until) {
        my ($t, undef, $name, $cb) = @{ $s->_pop };
        $s->{now} = $t;
        printf "t=%3d  %s\n", $t, $name;
        $cb->($s) if $cb;
    }
}

package main;

my $s = Scheduler->new;
my $ticks = 0;
my $tick;
$tick = sub { my $s = shift; $s->after(30, 'heartbeat', $tick) if ++$ticks < 4 };
$s->at(0, 'heartbeat', $tick);
$s->at(45, 'backup');
$s->at(10, 'email digest', sub { $_[0]->after(5, 'email sent') });
$s->at(45, 'report (same time, later insert)');
$s->run(100);
