local function merge(left, right)
  local result = {}
  local i, j = 1, 1
  while i <= #left and j <= #right do
    if left[i] <= right[j] then
      table.insert(result, left[i])
      i = i + 1
    else
      table.insert(result, right[j])
      j = j + 1
    end
  end
  while i <= #left do table.insert(result, left[i]); i = i + 1 end
  while j <= #right do table.insert(result, right[j]); j = j + 1 end
  return result
end

local function merge_sort(items)
  if #items <= 1 then return items end
  local mid = math.floor(#items / 2)
  local left, right = {}, {}
  for i = 1, mid do left[i] = items[i] end
  for i = mid + 1, #items do right[i - mid] = items[i] end
  return merge(merge_sort(left), merge_sort(right))
end

print(table.concat(merge_sort({ 5, 2, 9, 1, 5, 6 }), " "))
