BEGIN { printf "%-10s %6s\n", "NAME", "SCORE" }
{ printf "%-10s %6.1f\n", $1, $2; total += $2 }
END { printf "%-10s %6.1f\n", "TOTAL", total }
