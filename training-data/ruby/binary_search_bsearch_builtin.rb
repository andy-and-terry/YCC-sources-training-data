a = [1, 3, 5, 7, 9, 11]
puts a.bsearch { |x| x >= 6 }, a.bsearch_index { |x| x >= 6 }
puts (1..1000).bsearch { |n| n * n >= 200 }
def lower_bound(a, k)
  lo, hi = 0, a.size
  while lo < hi
    mid = (lo + hi) / 2
    a[mid] < k ? lo = mid + 1 : hi = mid
  end
  lo
end
puts lower_bound(a, 7), lower_bound(a, 8)
