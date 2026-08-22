def bubble_sort(items)
  arr = items.dup
  n = arr.length
  n.times do |i|
    swapped = false
    (n - i - 1).times do |j|
      if arr[j] > arr[j + 1]
        arr[j], arr[j + 1] = arr[j + 1], arr[j]
        swapped = true
      end
    end
    break unless swapped
  end
  arr
end

puts bubble_sort([5, 3, 8, 1, 9, 2]).inspect
