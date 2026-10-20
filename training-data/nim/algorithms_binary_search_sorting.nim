import algorithm, math

proc quicksort[T](a: var seq[T], lo, hi: int) =
  if lo >= hi: return
  let p = a[hi]
  var i = lo
  for j in lo ..< hi:
    if a[j] < p:
      swap(a[i], a[j])
      inc i
  swap(a[i], a[hi])
  quicksort(a, lo, i - 1)
  quicksort(a, i + 1, hi)

var data = @[5, 2, 9, 1, 5, 6, 3]
quicksort(data, 0, data.high)
echo data, " ", binarySearch(data, 6), " ", binarySearch(data, 4)
echo data.lowerBound(5), " ", data.upperBound(5)
var words = @["pear", "fig", "banana"]
words.sort(proc(a, b: string): int = cmp(a.len, b.len))
echo words, " ", words.sortedByIt(it)
echo @[3, 1, 2].sorted(Descending), " ", isSorted(data), " ", data.max, " ", data.min
echo sum(data), " ", gcd(48, 18), " ", lcm(4, 6), " ", sqrt(16.0), " ", floor(2.7), " ", pow(2.0, 8.0), " ", fac(5)
