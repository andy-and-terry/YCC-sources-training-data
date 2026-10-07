local function counting_sort(arr)
  if #arr == 0 then
    return {}
  end

  local max_val, min_val = arr[1], arr[1]
  for _, v in ipairs(arr) do
    if v > max_val then max_val = v end
    if v < min_val then min_val = v end
  end

  local counts = {}
  for i = min_val, max_val do
    counts[i] = 0
  end
  for _, v in ipairs(arr) do
    counts[v] = counts[v] + 1
  end

  local result = {}
  local idx = 1
  for v = min_val, max_val do
    for _ = 1, counts[v] do
      result[idx] = v
      idx = idx + 1
    end
  end
  return result
end

local sorted = counting_sort({ 4, 2, 2, 8, 3, 3, 1 })
print(table.concat(sorted, ", "))
