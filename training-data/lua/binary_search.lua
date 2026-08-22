local function binarySearch(arr, target)
  local low, high = 1, #arr
  while low <= high do
    local mid = (low + high) // 2
    if arr[mid] == target then
      return mid
    elseif arr[mid] < target then
      low = mid + 1
    else
      high = mid - 1
    end
  end
  return -1
end

local sorted = { 1, 3, 5, 7, 9, 11, 13 }
print(binarySearch(sorted, 7))
print(binarySearch(sorted, 4))
