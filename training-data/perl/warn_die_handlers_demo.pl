use strict;
use warnings;

local $SIG{__WARN__} = sub {
    my $msg = shift;
    chomp $msg;
    print "[warn handler] $msg\n";
};

warn "something odd\n";
my $x;
my $y = "value: " . (defined $x ? $x : "undef");
print "$y\n";

local $SIG{__DIE__} = sub { print "[die handler] $_[0]" };
eval { die "fatal thing\n" };
print "caught: $@";

local $SIG{ALRM} = sub { die "timeout\n" };
eval {
    alarm 1;
    select(undef, undef, undef, 0.1);
    alarm 0;
    print "finished before alarm\n";
};
