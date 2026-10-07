#!/usr/bin/awk -f
# Print the last N lines using a circular buffer: awk -v n=3 -f tail_last_n.awk file
BEGIN { if (n == "") n = 3 }
{ buf[NR % n] = $0 }
END {
    start = (NR > n) ? NR - n + 1 : 1
    for (i = start; i <= NR; i++) print buf[i % n]
}
