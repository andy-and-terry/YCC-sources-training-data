sorted = [1, 3, 5, 7, 9, 11, 13]

# find-minimum mode: first element >= 6
puts sorted.bsearch { |x| x >= 6 }

# find-any mode: block returns 0 on match
puts sorted.bsearch_index { |x| 9 <=> x }.inspect

# search on an answer space: smallest integer whose square >= 200
puts (1..1000).bsearch { |n| n * n >= 200 }

def lower_bound(arr, target)
  lo = 0
  hi = arr.size
  while lo < hi
    mid = (lo + hi) / 2
    arr[mid] < target ? lo = mid + 1 : hi = mid
  end
  lo
end

puts lower_bound(sorted, 8)
puts lower_bound(sorted, 100)
