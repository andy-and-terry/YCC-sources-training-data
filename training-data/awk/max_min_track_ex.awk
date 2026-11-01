NR == 1 { max = min = $1 }
{
  if ($1 > max) max = $1
  if ($1 < min) min = $1
}
END { print "min=" min, "max=" max, "range=" max - min }
