use strict; use warnings;
our $level = 1;
sub show { print "level=$level\n" }
sub nested { local $level = 2; show(); }
nested(); show();
