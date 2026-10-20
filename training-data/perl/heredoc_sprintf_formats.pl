use strict;
use warnings;

my ($name, $score) = ("Ada", 93.456);
print <<"END";
Name:  $name
Score: @{[ sprintf "%.1f", $score ]}
END
printf "%-6s|%6s|%06.2f|%x|%o|%e\n", "left", "right", 3.14159, 255, 8, 12345.678;
print <<'RAW';
No $interpolation here\n
RAW
