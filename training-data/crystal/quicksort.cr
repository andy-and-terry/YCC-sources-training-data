def quicksort(items : Array(Int32)) : Array(Int32)
  return items if items.size <= 1
  pivot = items[items.size // 2]
  left = items.select { |x| x < pivot }
  mid = items.select { |x| x == pivot }
  right = items.select { |x| x > pivot }
  quicksort(left) + mid + quicksort(right)
end

puts quicksort([5, 3, 8, 1, 9, 2]).inspect
