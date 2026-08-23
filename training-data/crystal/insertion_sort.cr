def insertion_sort(arr : Array(Int32)) : Array(Int32)
  a = arr.dup
  (1...a.size).each do |i|
    key = a[i]
    j = i - 1
    while j >= 0 && a[j] > key
      a[j + 1] = a[j]
      j -= 1
    end
    a[j + 1] = key
  end
  a
end

puts insertion_sort([12, 11, 13, 5, 6]).inspect
