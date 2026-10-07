use strict;
use warnings;
use Getopt::Long;

# Simulate command-line arguments.
@ARGV = ('--name=Ada', '-v', '-v', '--tag', 'x', '--tag', 'y', '--size', '3', 'rest');

my ($name, $verbose, $size, @tags) = ('anon', 0, 1);
GetOptions(
    'name=s'    => \$name,
    'verbose|v+' => \$verbose,
    'size=i'    => \$size,
    'tag=s'     => \@tags,
) or die "bad options\n";

print "name=$name verbose=$verbose size=$size tags=@tags remaining=@ARGV\n";
