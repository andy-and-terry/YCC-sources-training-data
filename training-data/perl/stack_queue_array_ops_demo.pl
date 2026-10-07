#!/usr/bin/perl
use strict;
use warnings;

my @stack;
push @stack, $_ for 1 .. 4;
print "top: $stack[-1]\n";
my $popped = pop @stack;
print "popped $popped, left: @stack\n";

my @queue = qw(a b c);
push @queue, 'd';
my $front = shift @queue;
print "dequeued $front, left: @queue\n";

unshift @queue, 'z';
print "after unshift: @queue\n";

my @removed = splice(@queue, 1, 2);
print "spliced out: @removed, left: @queue\n";

splice(@queue, 1, 0, 'x', 'y');
print "after insert: @queue\n";
print "last index: $#queue, count: ", scalar(@queue), "\n";
