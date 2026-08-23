local function selection_sort(items)
  local arr = {}
  for i, v in ipairs(items) do arr[i] = v end
  for i = 1, #arr - 1 do
    local min_idx = i
    for j = i + 1, #arr do
      if arr[j] < arr[min_idx] then min_idx = j end
    end
    arr[i], arr[min_idx] = arr[min_idx], arr[i]
  end
  return arr
end

print(table.concat(selection_sort({ 5, 3, 8, 1, 9, 2 }), " "))
