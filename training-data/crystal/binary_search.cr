def binary_search(arr : Array(Int32), target : Int32) : Int32
  low = 0
  high = arr.size - 1
  while low <= high
    mid = (low + high) // 2
    if arr[mid] == target
      return mid
    elsif arr[mid] < target
      low = mid + 1
    else
      high = mid - 1
    end
  end
  -1
end

sorted = [1, 3, 5, 7, 9, 11, 13]
puts binary_search(sorted, 7)
puts binary_search(sorted, 4)
