use strict;
use warnings;

sub horspool_all {
    my ($text, $pat) = @_;
    my ($n, $m) = (length $text, length $pat);
    return () if $m == 0 || $m > $n;
    my %shift;
    $shift{ substr($pat, $_, 1) } = $m - 1 - $_ for 0 .. $m - 2;
    my @hits;
    my $i = 0;
    while ($i <= $n - $m) {
        my $j = $m - 1;
        $j-- while $j >= 0 && substr($text, $i + $j, 1) eq substr($pat, $j, 1);
        push @hits, $i if $j < 0;
        $i += $shift{ substr($text, $i + $m - 1, 1) } // $m;
    }
    return @hits;
}

my $text = 'here is a simple example of a simple sample';
print join(' ', horspool_all($text, 'simple')), "\n";
print join(' ', horspool_all('aaaaa', 'aa')), "\n";
