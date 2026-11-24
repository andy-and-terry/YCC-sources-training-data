-- Moebius function: 0 if n has a squared prime factor, else (-1)^k.
local function mobius(n)
  local result, p = 1, 2
  while p * p <= n do
    if n % p == 0 then
      n = n // p
      if n % p == 0 then return 0 end
      result = -result
    end
    p = p + 1
  end
  return n > 1 and -result or result
end

local out = {}
for n = 1, 30 do out[#out + 1] = mobius(n) end
print(table.concat(out, " "))
