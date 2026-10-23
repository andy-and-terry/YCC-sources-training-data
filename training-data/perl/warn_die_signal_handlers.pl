use strict;
use warnings;

local $SIG{__WARN__} = sub { print "caught warning: $_[0]" };
local $SIG{__DIE__}  = sub { print "dying: $_[0]" };

warn "low disk space\n";

my $ok = eval { die "something broke\n"; 1 };
print "eval failed: $@" unless $ok;

{
    local $SIG{__WARN__} = sub { };
    warn "silenced\n";
}
warn "audible again\n";
