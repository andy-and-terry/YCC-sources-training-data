def count_inversions(arr)
  return [arr, 0] if arr.size <= 1

  left, a = count_inversions(arr[0...arr.size / 2])
  right, b = count_inversions(arr[arr.size / 2..])
  merged = []
  cross = 0
  i = j = 0
  while i < left.size && j < right.size
    if left[i] <= right[j]
      merged << left[i]
      i += 1
    else
      merged << right[j]
      cross += left.size - i
      j += 1
    end
  end
  [merged + left[i..] + right[j..], a + b + cross]
end

puts count_inversions([2, 4, 1, 3, 5]).last # 3
puts count_inversions([5, 4, 3, 2, 1]).last # 10
