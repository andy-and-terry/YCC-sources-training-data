-- Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
local function gcd(a, b)
  while b ~= 0 do a, b = b, a % b end
  return a
end

local function pow_mod(b, e, m)
  local r = 1
  b = b % m
  while e > 0 do
    if e & 1 == 1 then r = r * b % m end
    b = b * b % m
    e = e >> 1
  end
  return r
end

local function is_prime(n)
  local p = 2
  while p * p <= n do
    if n % p == 0 then return false end
    p = p + 1
  end
  return n > 1
end

local function is_carmichael(n)
  if is_prime(n) then return false end
  for a = 2, n - 1 do
    if gcd(a, n) == 1 and pow_mod(a, n - 1, n) ~= 1 then return false end
  end
  return true
end

local out = {}
for n = 3, 2999, 2 do
  if is_carmichael(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
