use strict;
use warnings;

my $code = '2 + 3 * 4';
my $result = eval $code;
print "$code = $result\n";

my $bad = eval 'my $x = ;';
print "syntax error caught: ", ($@ ? "yes" : "no"), "\n";

my $sub = eval 'sub { return $_[0] ** 2 }';
print "square(7) = ", $sub->(7), "\n";

for my $op (qw(+ - * /)) {
    my $r = eval "12 $op 4";
    print "12 $op 4 = $r\n";
}

my $div = eval { 1 / 0 };
print "runtime error: $@" if $@;
