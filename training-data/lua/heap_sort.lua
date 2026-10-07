local function siftDown(arr, n, root)
  while true do
    local largest = root
    local left = 2 * root
    local right = 2 * root + 1

    if left <= n and arr[left] > arr[largest] then
      largest = left
    end
    if right <= n and arr[right] > arr[largest] then
      largest = right
    end
    if largest == root then break end

    arr[root], arr[largest] = arr[largest], arr[root]
    root = largest
  end
end

local function heapSort(arr)
  local n = #arr
  for i = math.floor(n / 2), 1, -1 do
    siftDown(arr, n, i)
  end
  for i = n, 2, -1 do
    arr[1], arr[i] = arr[i], arr[1]
    siftDown(arr, i - 1, 1)
  end
  return arr
end

local values = { 5, 3, 8, 1, 9, 2, 7 }
print(table.concat(heapSort(values), " "))
