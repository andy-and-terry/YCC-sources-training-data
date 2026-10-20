use strict;
use warnings;

my $got = 0;
local $SIG{ALRM} = sub { $got++; die "timeout\n" };
alarm 1;
eval { 1 while 1; };
alarm 0;
print "caught: $@" if $@;
$SIG{USR1} = sub { print "usr1\n" };
kill 'USR1', $$;
select(undef, undef, undef, 0.05);
print "alarms=$got pid_ok=", ($$ > 0 ? 1 : 0), "\n";
