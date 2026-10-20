use strict;
use warnings;

printf "%-8s|%5.2f|%03d|%x|%o|%e|%s\n", "name", 3.14159, 7, 255, 8, 12345.6789, "end";
my $table = sprintf "%s has %d items totalling \$%.2f", "cart", 3, 29.5;
print "$table\n";
my $name = "World";
print <<"END";
Hello, $name!
  Sum: @{[ 2 + 3 ]}
END
print <<'END';
No $interpolation here
END
