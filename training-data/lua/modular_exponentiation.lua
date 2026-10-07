local function mod_pow(base, exp, mod)
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

print(mod_pow(2, 10, 1000000007))
print(mod_pow(7, 128, 13))
