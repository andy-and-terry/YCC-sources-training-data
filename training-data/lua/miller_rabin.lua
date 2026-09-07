local function powMod(base, exp, mod)
  local result = 1
  base = base % mod
  while exp > 0 do
    if exp % 2 == 1 then
      result = (result * base) % mod
    end
    exp = math.floor(exp / 2)
    base = (base * base) % mod
  end
  return result
end

local function isProbablyPrime(n, k)
  if n < 2 then return false end
  if n == 2 or n == 3 then return true end
  if n % 2 == 0 then return false end

  local d = n - 1
  local r = 0
  while d % 2 == 0 do
    d = d // 2
    r = r + 1
  end

  for _ = 1, k do
    local a = 2 + math.random(n - 4)
    local x = powMod(a, d, n)
    if x ~= 1 and x ~= n - 1 then
      local composite = true
      for _ = 1, r - 1 do
        x = (x * x) % n
        if x == n - 1 then
          composite = false
          break
        end
      end
      if composite then return false end
    end
  end
  return true
end

math.randomseed(42)
for _, n in ipairs({ 97, 561, 7919, 100, 104729 }) do
  print(n, isProbablyPrime(n, 20))
end
