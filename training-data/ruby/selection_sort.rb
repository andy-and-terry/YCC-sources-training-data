def selection_sort(items)
  arr = items.dup
  arr.length.times do |i|
    min_idx = i
    (i + 1...arr.length).each { |j| min_idx = j if arr[j] < arr[min_idx] }
    arr[i], arr[min_idx] = arr[min_idx], arr[i]
  end
  arr
end

puts selection_sort([5, 3, 8, 1, 9, 2]).inspect
