use strict;
use warnings;

package Complex;
use overload
    '+' => \&add, '-' => \&sub_, '*' => \&mul, '/' => \&div,
    'abs' => sub { sqrt($_[0]{re}**2 + $_[0]{im}**2) },
    '""' => \&str;

sub new { my ($c, $re, $im) = @_; bless { re => $re, im => $im // 0 }, $c }
sub lift { ref $_[0] ? $_[0] : Complex->new($_[0], 0) }
sub add { my ($a, $b) = (lift($_[0]), lift($_[1])); Complex->new($a->{re} + $b->{re}, $a->{im} + $b->{im}) }
sub sub_ {
    my ($a, $b, $swap) = (lift($_[0]), lift($_[1]), $_[2]);
    ($a, $b) = ($b, $a) if $swap;
    Complex->new($a->{re} - $b->{re}, $a->{im} - $b->{im});
}
sub mul {
    my ($a, $b) = (lift($_[0]), lift($_[1]));
    Complex->new($a->{re} * $b->{re} - $a->{im} * $b->{im}, $a->{re} * $b->{im} + $a->{im} * $b->{re});
}
sub div {
    my ($a, $b, $swap) = (lift($_[0]), lift($_[1]), $_[2]);
    ($a, $b) = ($b, $a) if $swap;
    my $d = $b->{re}**2 + $b->{im}**2;
    Complex->new(($a->{re} * $b->{re} + $a->{im} * $b->{im}) / $d, ($a->{im} * $b->{re} - $a->{re} * $b->{im}) / $d);
}
sub str { my $s = shift; sprintf '%g%+gi', $s->{re}, $s->{im} }

package main;

my $z = Complex->new(3, 4);
my $w = Complex->new(1, -2);
print "z=$z w=$w z+w=", $z + $w, ' z*w=', $z * $w, ' z/w=', $z / $w, ' |z|=', abs($z), "\n";

for my $y (reverse -6 .. 6) {
    my $row = '';
    for my $x (-20 .. 8) {
        my $c = Complex->new($x / 10, $y / 6);
        my $q = Complex->new(0, 0);
        my $i = 0;
        $q = $q * $q + $c, $i++ while $i < 30 && abs($q) <= 2;
        $row .= $i == 30 ? '#' : '.';
    }
    print "$row\n";
}
