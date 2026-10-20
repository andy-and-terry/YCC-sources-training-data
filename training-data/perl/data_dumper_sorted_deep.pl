use strict;
use warnings;
use Data::Dumper;

$Data::Dumper::Sortkeys = 1;
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
print Dumper({ b => [1, 2], a => { x => undef }, c => \"str" });
local $Data::Dumper::Indent = 0;
print Dumper([1, 'two', 3.5]), "\n";
