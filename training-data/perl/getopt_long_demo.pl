use strict;
use warnings;
use Getopt::Long qw(GetOptionsFromArray);

my @args = ('--name', 'Ada', '-v', '-v', '--size=10', '--tag', 'x', '--tag', 'y',
            '--no-color', 'file1', 'file2');

my %opt = (name => 'anon', size => 1, color => 1, verbose => 0);
my @tags;

GetOptionsFromArray(
    \@args,
    'name=s'    => \$opt{name},
    'size=i'    => \$opt{size},
    'verbose|v+' => \$opt{verbose},
    'tag=s'     => \@tags,
    'color!'    => \$opt{color},
) or die "bad options\n";

print "name=$opt{name} size=$opt{size} verbose=$opt{verbose} color=$opt{color}\n";
print "tags=@tags\n";
print "remaining=@args\n";
