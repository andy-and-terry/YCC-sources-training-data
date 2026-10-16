use strict;
use warnings;

for my $mod (qw(List::Util POSIX No::Such::Module)) {
    (my $file = "$mod.pm") =~ s{::}{/}g;
    if (eval { require $file; 1 }) {
        print "$mod loaded\n";
    } else {
        print "$mod missing\n";
    }
}

require List::Util;
print "max: ", List::Util::max(3, 9, 4), "\n";

my $func = "List::Util"->can('sum');
print "sum via can: ", $func->(1 .. 10), "\n";

{
    no strict 'refs';
    my $name = "List::Util::min";
    print "symbolic min: ", &$name(8, 2, 5), "\n";
}
