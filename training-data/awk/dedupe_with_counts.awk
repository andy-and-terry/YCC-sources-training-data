#!/usr/bin/awk -f
# Like uniq -c but across the entire input, in first-seen order
!($0 in seen) { order[++n] = $0 }
{ seen[$0]++ }
END { for (i = 1; i <= n; i++) printf "%4d %s\n", seen[order[i]], order[i] }
