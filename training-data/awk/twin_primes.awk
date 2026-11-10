BEGIN {
  limit = 80
  for (i = 2; i * i <= limit; i++)
    if (!(i in composite))
      for (j = i * i; j <= limit; j += i) composite[j] = 1
  for (p = 3; p + 2 <= limit; p++)
    if (!(p in composite) && !((p + 2) in composite)) printf "(%d,%d) ", p, p + 2
  print "" # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
}
