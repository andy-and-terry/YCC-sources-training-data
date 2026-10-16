local function slice(t, i, j)
  local out = {}
  for k = i or 1, j or #t do
    out[#out + 1] = t[k]
  end
  return out
end

local function reverse(t)
  local out = {}
  for i = #t, 1, -1 do out[#out + 1] = t[i] end
  return out
end

local nums = { 1, 2, 3, 4, 5, 6 }
print(table.concat(slice(nums, 2, 4), " "))
print(table.concat(slice(nums, 4), " "))
print(table.concat(reverse(nums), " "))
