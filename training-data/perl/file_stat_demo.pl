use strict;
use warnings;
use File::Temp qw(tempdir);
use File::Spec;
use POSIX qw(strftime);

my $dir  = tempdir(CLEANUP => 1);
my $file = File::Spec->catfile($dir, "sample.txt");

open(my $fh, '>', $file) or die "cannot write $file: $!";
print $fh "line $_\n" for 1 .. 5;
close $fh;
chmod 0640, $file;

my @st = stat($file) or die "stat failed: $!";
my @names = qw(dev ino mode nlink uid gid rdev size atime mtime ctime blksize blocks);
my %info;
@info{@names} = @st;

printf "size:  %d bytes\n", $info{size};
printf "mode:  %04o\n", $info{mode} & 07777;
printf "mtime: %s\n", strftime("%Y-%m-%d", localtime $info{mtime});
printf "links: %d\n", $info{nlink};

# file test operators
print "-e exists:   ", (-e $file ? "yes" : "no"), "\n";
print "-f plain:    ", (-f $file ? "yes" : "no"), "\n";
print "-d dir:      ", (-d $dir  ? "yes" : "no"), "\n";
print "-s size:     ", -s $file, "\n";
print "-r readable: ", (-r $file ? "yes" : "no"), "\n";
print "-x exec:     ", (-x $file ? "yes" : "no"), "\n";

# stacked file tests (perl 5.10+)
print "readable plain file: ", ((-f -r $file) ? "yes" : "no"), "\n";
print "missing file: ", (stat("$dir/nope") ? "found" : "stat failed"), "\n";
