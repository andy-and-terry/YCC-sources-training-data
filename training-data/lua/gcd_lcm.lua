local function my_gcd(a, b)
  while b ~= 0 do
    a, b = b, a % b
  end
  return math.abs(a)
end

local function my_lcm(a, b)
  return math.abs(a * b) // my_gcd(a, b)
end

print(my_gcd(48, 18))
print(my_lcm(4, 6))
