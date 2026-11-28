local function gcd(a, b)
  while b ~= 0 do a, b = b, a % b end
  return a
end

local function rho(n)
  if n % 2 == 0 then return 2 end
  local function f(v) return (v * v + 1) % n end
  local x, y, d = 2, 2, 1
  while d == 1 do
    x = f(x); y = f(f(y))
    d = gcd(math.abs(x - y), n)
  end
  return d
end

local n = 8051
local p = rho(n)
print(string.format("%d = %d * %d", n, p, n // p))
