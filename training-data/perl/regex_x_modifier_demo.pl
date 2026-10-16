use strict;
use warnings;

my $date_re = qr/
    ^
    (?<year>  \d{4} )   # four digit year
    -
    (?<month> 0[1-9] | 1[0-2] )
    -
    (?<day>   0[1-9] | [12]\d | 3[01] )
    $
/x;

for my $d ("2024-03-15", "2024-13-01", "99-01-01") {
    if ($d =~ $date_re) {
        print "$d ok: y=$+{year} m=$+{month} d=$+{day}\n";
    } else {
        print "$d invalid\n";
    }
}

my $phone = qr/ \(? (\d{3}) \)? [\s.-]? (\d{3}) [\s.-]? (\d{4}) /x;
my @parts = "call (555) 123-4567 now" =~ $phone;
print "@parts\n";
