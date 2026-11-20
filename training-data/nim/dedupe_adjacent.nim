# Remove consecutive duplicate characters.
proc dedupe(s: string): string =
  for i, c in s:
    if i == 0 or c != s[i - 1]: result.add c

echo dedupe("aabbbcdd")
