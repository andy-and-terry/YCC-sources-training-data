-- Highest value reached by the Collatz (hailstone) sequence from n.
local function peak(n)
  local best = n
  while n ~= 1 do
    if n % 2 == 0 then n = n // 2 else n = 3 * n + 1 end
    best = math.max(best, n)
  end
  return best
end

print(peak(27))
