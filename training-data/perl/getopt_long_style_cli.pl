use strict;
use warnings;
use Getopt::Long qw(GetOptionsFromArray);

my @args = ('--name=Ada', '-v', '-v', '--tag', 'a', '--tag', 'b', '--no-color', 'extra');
my ($name, $verbose, @tags, $color) = ('', 0);
$color = 1;
GetOptionsFromArray(\@args, 'name=s' => \$name, 'v+' => \$verbose, 'tag=s' => \@tags, 'color!' => \$color) or die;
print "$name $verbose @tags $color rest=@args\n";
