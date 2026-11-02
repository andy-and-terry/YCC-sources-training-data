use strict; use warnings;
my @t = gmtime(0);
printf "%04d-%02d-%02d\n", $t[5] + 1900, $t[4] + 1, $t[3];
