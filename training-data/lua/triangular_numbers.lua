local function triangular(count)
  local sum, n = 0, 0
  return function()
    if n >= count then return nil end
    n = n + 1
    sum = sum + n
    return sum
  end
end

local out = {}
for t in triangular(10) do out[#out + 1] = t end
print(table.concat(out, " "))
