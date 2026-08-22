#!/usr/bin/awk -f
# Prints lines where the second field exceeds a threshold.
$2 > 50 { print }
