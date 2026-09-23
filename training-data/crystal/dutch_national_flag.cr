def dutch_national_flag(arr : Array(Int32)) : Array(Int32)
  low = 0
  mid = 0
  high = arr.size - 1
  while mid <= high
    case arr[mid]
    when 0
      arr[low], arr[mid] = arr[mid], arr[low]
      low += 1
      mid += 1
    when 1
      mid += 1
    else
      arr[mid], arr[high] = arr[high], arr[mid]
      high -= 1
    end
  end
  arr
end

puts dutch_national_flag([2, 0, 2, 1, 1, 0]).inspect
puts dutch_national_flag([0, 1, 2, 0, 1, 2]).inspect
