use strict;
use warnings;
use File::Basename qw(basename dirname fileparse);
use File::Spec;
use File::Temp qw(tempdir);

my ($name, $dir, $suffix) = fileparse("/a/b/report.final.txt", qr/\.[^.]*/);
print "$name $dir $suffix ", basename("/x/y.pl"), " ", dirname("/x/y.pl"), "\n";
my $tmp = tempdir(CLEANUP => 1);
for my $f (qw(a.txt b.txt c.log)) { open my $h, '>', File::Spec->catfile($tmp, $f) or die; close $h }
my @txt = map { basename $_ } glob("$tmp/*.txt");
print "@txt\n";
opendir(my $d, $tmp) or die; my @all = sort grep { !/^\./ } readdir $d; closedir $d;
print scalar(@all), "\n";
