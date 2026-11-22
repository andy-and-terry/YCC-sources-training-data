# Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
import strutils

var parts: seq[string]
for n in 0 ..< 10:
  parts.add $(n * (n + 1) div 2 + 1)
echo parts.join(" ")
