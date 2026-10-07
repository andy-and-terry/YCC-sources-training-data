use strict;
use warnings;

my $name = "Ada";
my $score = 95;

my $report = <<"END_REPORT";
Report for $name
-----------------
Score: $score
Grade: ${\ ($score >= 90 ? "A" : "B")}
END_REPORT

print $report;

my $literal = <<'END_LITERAL';
This $variable is not interpolated.
END_LITERAL

print $literal;
