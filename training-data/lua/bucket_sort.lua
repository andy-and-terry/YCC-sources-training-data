local function bucket_sort(arr, bucket_count)
  if #arr == 0 then return arr end

  local min_val, max_val = arr[1], arr[1]
  for _, v in ipairs(arr) do
    if v < min_val then min_val = v end
    if v > max_val then max_val = v end
  end

  local range = (max_val - min_val + 1) / bucket_count
  local buckets = {}
  for i = 1, bucket_count do buckets[i] = {} end

  for _, v in ipairs(arr) do
    local index = math.min(bucket_count, math.floor((v - min_val) / range) + 1)
    table.insert(buckets[index], v)
  end

  local result = {}
  for i = 1, bucket_count do
    table.sort(buckets[i])
    for _, v in ipairs(buckets[i]) do
      table.insert(result, v)
    end
  end
  return result
end

local sorted = bucket_sort({ 29, 25, 3, 49, 9, 37, 21, 43 }, 4)
print(table.concat(sorted, ", "))
