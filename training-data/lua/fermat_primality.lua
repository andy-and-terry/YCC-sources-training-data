-- Fermat primality test; Carmichael number 561 fools it.
local function powmod(b, e, m)
  local r = 1
  b = b % m
  while e > 0 do
    if e % 2 == 1 then r = r * b % m end
    b = b * b % m
    e = e // 2
  end
  return r
end

local function probably_prime(n)
  return n > 2 and powmod(2, n - 1, n) == 1
end

for _, n in ipairs({97, 91, 561}) do
  print(n, probably_prime(n))
end
