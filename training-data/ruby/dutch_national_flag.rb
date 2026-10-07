def dutch_national_flag(arr, pivot = 1)
  low, mid, high = 0, 0, arr.length - 1

  while mid <= high
    case arr[mid] <=> pivot
    when -1
      arr[low], arr[mid] = arr[mid], arr[low]
      low += 1
      mid += 1
    when 0
      mid += 1
    when 1
      arr[mid], arr[high] = arr[high], arr[mid]
      high -= 1
    end
  end
  arr
end

puts dutch_national_flag([2, 0, 2, 1, 1, 0]).inspect
puts dutch_national_flag([2, 0, 1]).inspect
