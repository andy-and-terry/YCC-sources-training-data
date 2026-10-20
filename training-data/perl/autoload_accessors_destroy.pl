use strict;
use warnings;

package Rec;
our $AUTOLOAD;
sub new { bless { id => 1, name => 'n' }, shift }
sub AUTOLOAD {
    my $s = shift; (my $m = $AUTOLOAD) =~ s/.*:://;
    return if $m eq 'DESTROY';
    die "no method $m" unless exists $s->{$m};
    $s->{$m} = shift if @_;
    return $s->{$m};
}

package main;
my $r = Rec->new;
$r->name('changed');
print $r->id, $r->name, "\n";
eval { $r->bogus }; print "err: ", $@ =~ /no method bogus/ ? "ok" : "bad", "\n";
