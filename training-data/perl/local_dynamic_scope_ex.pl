use strict; use warnings;
our $level = 1;
sub show { print "level=$level\n" }
sub with_debug { local $level = 99; show() }
show(); with_debug(); show();
