use strict;
use warnings;

sub luhn_sum {
    my @d = reverse split //, shift;
    my $sum = 0;
    for my $i (0 .. $#d) {
        my $v = $d[$i] * ($i % 2 ? 2 : 1);
        $sum += $v > 9 ? $v - 9 : $v;
    }
    return $sum;
}

sub luhn_valid { (my $s = shift) =~ s/ //g; $s =~ /^\d{2,}$/ && luhn_sum($s) % 10 == 0 ? 1 : 0 }
sub check_digit { (10 - luhn_sum($_[0] . '0') % 10) % 10 }

print join(' ', map { luhn_valid($_) } '4539 3195 0343 6467', '8273 1232 7352 0569', '12a4'), "\n";
print 'check digit for 7992739871: ', check_digit('7992739871'), "\n";
