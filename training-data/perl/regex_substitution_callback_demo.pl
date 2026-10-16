use strict;
use warnings;

my $text = "price: 5 apples at 12 cents";
(my $doubled = $text) =~ s/(\d+)/$1 * 2/ge;
print "$doubled\n";

my %vars = (name => "Ada", lang => "Perl");
my $tpl = "Hello {name}, welcome to {lang}. {unknown}";
$tpl =~ s/\{(\w+)\}/exists $vars{$1} ? $vars{$1} : "{$1}"/ge;
print "$tpl\n";

my $snake = "someVariableName";
$snake =~ s/([A-Z])/"_" . lc $1/ge;
print "$snake\n";

my $copy = "a.b.c";
my $new = $copy =~ s/\./::/gr;
print "$copy -> $new\n";
my $n = () = "banana" =~ /a/g;
print "a appears $n times\n";
