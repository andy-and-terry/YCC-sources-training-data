-- Ways to write n as a sum of two or more consecutive positive integers.
local function polite_ways(n)
  local ways, k = 0, 2
  while k * (k + 1) // 2 <= n do
    if (n - k * (k - 1) // 2) % k == 0 then ways = ways + 1 end
    k = k + 1
  end
  return ways
end

local out = {}
for n = 1, 16 do out[#out + 1] = polite_ways(n) end
print(table.concat(out, " "))
