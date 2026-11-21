-- Amicable pairs below 1500 via sums of proper divisors.
local function s(n)
  local t = 0
  for d = 1, n - 1 do
    if n % d == 0 then t = t + d end
  end
  return t
end

for a = 2, 1499 do
  local b = s(a)
  if b > a and s(b) == a then print(a, b) end
end
