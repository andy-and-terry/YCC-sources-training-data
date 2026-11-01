{
  for (i = 1; i <= NF; i++) len[length($i)]++
}
END {
  for (l = 1; l <= 10; l++) {
    bar = ""
    for (j = 0; j < len[l]; j++) bar = bar "#"
    printf "%2d %s\n", l, bar
  }
}
