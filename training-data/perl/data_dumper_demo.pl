use strict;
use warnings;
use Data::Dumper;

$Data::Dumper::Sortkeys = 1;
$Data::Dumper::Indent   = 1;

my $data = {
    name  => 'widget',
    tags  => [qw(a b)],
    specs => { w => 3, h => 4 },
};

print Dumper($data);

local $Data::Dumper::Terse = 1;
local $Data::Dumper::Indent = 0;
print Dumper([1, 'two', { three => 3 }]), "\n";
