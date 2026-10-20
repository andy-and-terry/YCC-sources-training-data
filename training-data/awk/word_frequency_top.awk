{
  for (i = 1; i <= NF; i++) freq[tolower($i)]++
}
END {
  for (w in freq) print freq[w], w | "sort -rn | head -3"
}
