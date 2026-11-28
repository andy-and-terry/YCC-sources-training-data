local function popcount(n)
  local c = 0
  while n ~= 0 do
    n = n & (n - 1)
    c = c + 1
  end
  return c
end

print(popcount(0xB7), popcount(255), popcount(0))
