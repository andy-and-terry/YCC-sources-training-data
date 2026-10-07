-- Lua 5.3+ integer bitwise operators (&, |, ~, <<, >>) and floor
-- division (//), used to implement a few classic bit tricks.
local a, b = 0xF0, 0x0F

print(string.format("a & b = %d", a & b))
print(string.format("a | b = %d", a | b))
print(string.format("a ~ b = %d", a ~ b))  -- bitwise xor
print(string.format("~a    = %d", ~a))     -- bitwise not
print(string.format("a << 2 = %d", a << 2))
print(string.format("a >> 2 = %d", a >> 2))

local function popcount(n)
  local count = 0
  while n ~= 0 do
    count = count + (n & 1)
    n = n >> 1
  end
  return count
end

local function is_power_of_two(n)
  return n > 0 and (n & (n - 1)) == 0
end

print("popcount(29):", popcount(29))
print("17 // 5 =", 17 // 5)
for _, n in ipairs({ 1, 2, 3, 16, 18 }) do
  print(n, is_power_of_two(n))
end
