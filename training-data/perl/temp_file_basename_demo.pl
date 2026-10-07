use strict;
use warnings;
use File::Temp qw(tempfile);
use File::Basename qw(basename dirname fileparse);

my ($fh, $filename) = tempfile(SUFFIX => '.txt', UNLINK => 1);
print $fh "line one\nline two\n";
close $fh;

print "exists: ", (-e $filename ? "yes" : "no"), "\n";
print "size: ", -s $filename, " bytes\n";

my ($name, $dir, $suffix) = fileparse("/var/log/app/server.log", qr/\.[^.]*/);
print "name=$name dir=$dir suffix=$suffix\n";
print basename("/a/b/c.txt"), " in ", dirname("/a/b/c.txt"), "\n";
