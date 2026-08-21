local function quicksort(items)
  if #items <= 1 then return items end

  local pivot = items[math.ceil(#items / 2)]
  local left, mid, right = {}, {}, {}

  for _, x in ipairs(items) do
    if x < pivot then table.insert(left, x)
    elseif x > pivot then table.insert(right, x)
    else table.insert(mid, x)
    end
  end

  local result = {}
  for _, x in ipairs(quicksort(left)) do table.insert(result, x) end
  for _, x in ipairs(mid) do table.insert(result, x) end
  for _, x in ipairs(quicksort(right)) do table.insert(result, x) end
  return result
end

local sorted = quicksort({ 5, 3, 8, 1, 9, 2 })
print(table.concat(sorted, " "))
