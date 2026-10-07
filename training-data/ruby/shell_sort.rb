def shell_sort(array)
  array = array.dup
  gap = array.size / 2

  while gap.positive?
    (gap...array.size).each do |i|
      temp = array[i]
      j = i

      while j >= gap && array[j - gap] > temp
        array[j] = array[j - gap]
        j -= gap
      end
      array[j] = temp
    end
    gap /= 2
  end

  array
end

puts shell_sort([12, 34, 54, 2, 3]).inspect
puts shell_sort([9, 1, 8, 2, 7, 3]).inspect
