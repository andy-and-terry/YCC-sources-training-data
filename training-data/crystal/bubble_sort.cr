def bubble_sort(arr : Array(Int32)) : Array(Int32)
  a = arr.dup
  (0...a.size).each do |i|
    (0...(a.size - i - 1)).each do |j|
      if a[j] > a[j + 1]
        a[j], a[j + 1] = a[j + 1], a[j]
      end
    end
  end
  a
end

puts bubble_sort([5, 2, 9, 1, 5, 6]).inspect
