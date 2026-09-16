def quickselect(arr, k)
  return arr[0] if arr.length == 1

  pivot = arr.sample
  highs = arr.select { |x| x > pivot }
  lows = arr.select { |x| x < pivot }
  pivots = arr.select { |x| x == pivot }

  if k <= highs.length
    quickselect(highs, k)
  elsif k <= highs.length + pivots.length
    pivot
  else
    quickselect(lows, k - highs.length - pivots.length)
  end
end

def kth_largest(arr, k)
  quickselect(arr, k)
end

values = [3, 2, 1, 5, 6, 4, 8, 7]
puts kth_largest(values, 2)
puts kth_largest(values, 1)
