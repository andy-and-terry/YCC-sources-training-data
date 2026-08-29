use strict;
use warnings;

our $global_var = "outer";

sub show_global {
    print "$global_var\n";
}

sub with_local {
    local $global_var = "inner";
    show_global();
}

with_local();
show_global();
