local function is_harshad(n)
  local s, m = 0, n
  while m > 0 do
    s = s + m % 10
    m = m // 10
  end
  return n > 0 and n % s == 0
end

local out = {}
for n = 1, 49 do
  if is_harshad(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
