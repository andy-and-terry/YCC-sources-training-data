use strict;
use warnings;

package Swimmer;

sub new { return bless {}, shift; }

sub move { return "swims"; }

sub swim { return "paddles through water"; }

package Runner;

sub new { return bless {}, shift; }

sub move { return "runs"; }

sub run { return "sprints on land"; }

package Duck;

our @ISA = ('Swimmer', 'Runner');

package main;

my $duck = Duck->new();
print $duck->move, "\n";
print $duck->swim, "\n";
print $duck->run, "\n";
print "isa Swimmer: ", ($duck->isa('Swimmer') ? "yes" : "no"), "\n";
print "isa Runner: ", ($duck->isa('Runner') ? "yes" : "no"), "\n";
