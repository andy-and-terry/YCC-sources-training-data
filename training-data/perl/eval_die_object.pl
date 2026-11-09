use strict; use warnings;
package MyErr; sub new { bless { msg => $_[1] }, $_[0] } sub msg { $_[0]{msg} }
package main;
eval { die MyErr->new("custom failure") };
if (ref $@ && $@->isa('MyErr')) { print "caught: ", $@->msg, "\n" }
