local function digit_sum(n)
  local s = 0
  while n > 0 do
    s = s + n % 10
    n = n // 10
  end
  return s
end

local function is_smith(n)
  local m, sum, p = n, 0, 2
  while p * p <= m do
    while m % p == 0 do
      sum = sum + digit_sum(p)
      m = m // p
    end
    p = p + 1
  end
  if m == n then return false end -- prime
  if m > 1 then sum = sum + digit_sum(m) end
  return sum == digit_sum(n)
end

local out = {}
for i = 2, 99 do
  if is_smith(i) then out[#out + 1] = i end
end
print(table.concat(out, " "))
