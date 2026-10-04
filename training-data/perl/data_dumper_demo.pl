use strict;
use warnings;
use Data::Dumper;

$Data::Dumper::Sortkeys = 1;
$Data::Dumper::Indent   = 1;

my $config = {
    name    => 'server',
    ports   => [80, 443],
    options => { debug => 0, tags => ['a', 'b'] },
};

print Dumper($config);

{
    local $Data::Dumper::Terse = 1;
    local $Data::Dumper::Indent = 0;
    print Dumper([1, 'two', { three => 3 }]), "\n";
}

# round trip through eval
my $text = Data::Dumper->new([$config], ['cfg'])->Dump;
my $cfg;
eval $text;
print "restored port: $cfg->{ports}[1]\n";
