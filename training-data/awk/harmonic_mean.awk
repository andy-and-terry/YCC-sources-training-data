#!/usr/bin/awk -f
# Harmonic mean of the first column
$1 > 0 { s += 1 / $1; n++ }
END { if (n) printf "%.4f\n", n / s }
