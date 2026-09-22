def shell_sort(arr : Array(Int32)) : Array(Int32)
  a = arr.dup
  n = a.size
  gap = n // 2

  while gap > 0
    (gap...n).each do |i|
      temp = a[i]
      j = i
      while j >= gap && a[j - gap] > temp
        a[j] = a[j - gap]
        j -= gap
      end
      a[j] = temp
    end
    gap //= 2
  end

  a
end

puts shell_sort([9, 5, 1, 4, 8, 3, 7, 2, 6]).inspect
