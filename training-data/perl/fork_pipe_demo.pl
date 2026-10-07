use strict;
use warnings;

# Parent reads results from a child process over a pipe.
pipe(my $reader, my $writer) or die "pipe: $!";
my $pid = fork() // die "fork: $!";

if ($pid == 0) {
    close $reader;
    print $writer "child computed ", 6 * 7, "\n";
    close $writer;
    exit 0;
}

close $writer;
while (my $line = <$reader>) {
    print "parent received: $line";
}
close $reader;
waitpid($pid, 0);
print "child exit status: ", $? >> 8, "\n";
