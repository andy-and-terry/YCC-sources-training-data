def insertion_sort(items)
  arr = items.dup
  (1...arr.length).each do |i|
    key = arr[i]
    j = i - 1
    while j >= 0 && arr[j] > key
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = key
  end
  arr
end

puts insertion_sort([5, 3, 8, 1, 9, 2]).inspect
