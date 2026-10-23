use strict;
use warnings;
use feature qw(say signatures);
no warnings 'experimental::signatures';

# Subroutine signatures replace the "my ($a, $b) = @_;" idiom.
sub add ($x, $y) {
    return $x + $y;
}

# Defaults can be expressions and may refer to earlier parameters.
sub greet ($name, $greeting = "Hello", $punct = $greeting eq "Hello" ? "!" : ".") {
    return "$greeting, $name$punct";
}

# A slurpy array or hash collects the rest of the arguments.
sub total ($label, @nums) {
    my $sum = 0;
    $sum += $_ for @nums;
    return "$label: $sum";
}

sub options ($name, %opts) {
    return join ",", $name, map { "$_=$opts{$_}" } sort keys %opts;
}

say add(2, 3);
say greet("Ada");
say greet("Ada", "Welcome");
say total("sum", 1 .. 5);
say options("cfg", b => 2, a => 1);

# Wrong argument counts die with a clear message.
eval { add(1) };
print "error: $@" if $@;
