use strict; use warnings;
my $file = "/tmp/_perl_slurp_demo.txt";
open my $out, '>', $file or die $!;
print $out "line1\nline2\nline3\n";
close $out;
my $content = do { local $/; open my $in, '<', $file or die $!; <$in> };
print length($content), " bytes, ", ($content =~ tr/\n//), " lines\n";
unlink $file;
