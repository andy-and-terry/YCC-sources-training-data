use strict;
use warnings;
use Hash::Util qw(lock_keys unlock_keys lock_hash);

my %config = (host => 'localhost', port => 8080);
lock_keys(%config);

$config{port} = 9090;
print "port is now $config{port}\n";

eval { $config{hostname} = 'typo' };
print "error: $@" if $@;

eval { my $v = $config{prot} };
print "error: $@" if $@;

unlock_keys(%config);
$config{debug} = 1;
print join(",", sort keys %config), "\n";

lock_hash(%config);
eval { $config{port} = 1 };
print "error: $@" if $@;
