def quicksort(items)
  return items if items.length <= 1

  pivot = items[items.length / 2]
  left = items.select { |x| x < pivot }
  mid = items.select { |x| x == pivot }
  right = items.select { |x| x > pivot }

  quicksort(left) + mid + quicksort(right)
end

puts quicksort([5, 3, 8, 1, 9, 2]).inspect
