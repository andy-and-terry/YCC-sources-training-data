#!/usr/bin/awk -f
# Keep the last N lines in a circular buffer (like tail -n).
BEGIN { if (N == "") N = 3 }
{ buf[NR % N] = $0 }
END {
    start = (NR > N) ? NR - N + 1 : 1
    for (i = start; i <= NR; i++) print buf[i % N]
}
