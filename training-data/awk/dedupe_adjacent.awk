# Collapse consecutive duplicate characters on each input line.
{
  out = ""; prev = ""
  for (i = 1; i <= length($0); i++) {
    c = substr($0, i, 1)
    if (c != prev) out = out c
    prev = c
  }
  print out
}
