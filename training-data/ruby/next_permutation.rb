def next_permutation!(arr)
  i = arr.length - 2
  i -= 1 while i >= 0 && arr[i] >= arr[i + 1]

  if i >= 0
    j = arr.length - 1
    j -= 1 while arr[j] <= arr[i]
    arr[i], arr[j] = arr[j], arr[i]
  end

  lo, hi = i + 1, arr.length - 1
  while lo < hi
    arr[lo], arr[hi] = arr[hi], arr[lo]
    lo += 1
    hi -= 1
  end
  arr
end

puts next_permutation!([1, 2, 3]).inspect
puts next_permutation!([3, 2, 1]).inspect
puts next_permutation!([1, 1, 5]).inspect
