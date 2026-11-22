-- Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
local function fact(n)
  local f = 1
  for i = 2, n do f = f * i end
  return f
end
local function comb(n, k) return fact(n) // (fact(k) * fact(n - k)) end

local n, out = 5, {}
for k = 1, n do out[#out + 1] = comb(n - 1, k - 1) * fact(n) // fact(k) end
print(table.concat(out, " "))
