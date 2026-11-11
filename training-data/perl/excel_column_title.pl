use strict;
use warnings;

sub column_title {
    my $n = shift;
    my $title = "";
    while ($n > 0) {
        $n--;
        $title = chr(65 + $n % 26) . $title;
        $n = int($n / 26);
    }
    return $title;
}

print column_title(28), " ", column_title(701), "\n";    # AB ZY
