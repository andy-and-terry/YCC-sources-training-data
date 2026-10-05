use strict;
use warnings;
use Data::Dumper;

$Data::Dumper::Sortkeys = 1;
$Data::Dumper::Indent   = 1;
$Data::Dumper::Terse    = 1;

my $config = {
    name  => 'server',
    ports => [80, 443],
    tls   => { enabled => 1, cert => 'a.pem' },
};
print Dumper($config);

local $Data::Dumper::Indent = 0;
print Dumper([1, 'two', { three => 3 }]), "\n";
