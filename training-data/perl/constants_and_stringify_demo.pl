use strict;
use warnings;

use constant PI => 3.14159265;
use constant DEBUG => 0;
use constant COLORS => qw(red green blue);
use constant {
    MAX_USERS => 100,
    NAME      => 'demo',
};

printf "area of unit circle: %.4f\n", PI * 1 ** 2;
print "debug is off\n" unless DEBUG;
my @c = (COLORS);
print "colors: @c (", scalar(@c), ")\n";
print "second color: ", (COLORS)[1], "\n";
print "limit: ${\ MAX_USERS} for @{[ NAME ]}\n";

my %h = (PI, 'pi value');                      # constants are barewords in lists
print join(",", keys %h), "\n";
print "constant in hash key: ", {PI() => 1}->{3.14159265} // 'missing', "\n";

print "can call as sub: ", main->can('MAX_USERS')->(), "\n";
