-- Amicable pairs: d(a) == b and d(b) == a with a ~= b.
local function d(n)
  local s = 0
  for i = 1, n - 1 do
    if n % i == 0 then s = s + i end
  end
  return s
end

for a = 2, 1499 do
  local b = d(a)
  if b > a and d(b) == a then print(a, b) end
end
