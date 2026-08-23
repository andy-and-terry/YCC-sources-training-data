def selection_sort(arr : Array(Int32)) : Array(Int32)
  a = arr.dup
  (0...a.size - 1).each do |i|
    min_idx = i
    (i + 1...a.size).each do |j|
      min_idx = j if a[j] < a[min_idx]
    end
    a[i], a[min_idx] = a[min_idx], a[i]
  end
  a
end

puts selection_sort([64, 25, 12, 22, 11]).inspect
