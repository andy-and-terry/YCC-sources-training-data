use strict; use warnings;

package Query;
sub new { bless { parts => [] }, shift }
sub select { my $s = shift; push @{ $s->{parts} }, "SELECT " . join(", ", @_); $s }
sub from   { my ($s, $t) = @_; push @{ $s->{parts} }, "FROM $t"; $s }
sub where  { my ($s, $c) = @_; push @{ $s->{parts} }, "WHERE $c"; $s }
sub build  { join " ", @{ $_[0]{parts} } }

package main;
print Query->new->select(qw(id name))->from("users")->where("age > 18")->build, "\n";
