local function is_powerful(n)
  local p = 2
  while p * p <= n do
    if n % p == 0 then
      if n % (p * p) ~= 0 then return false end
      while n % p == 0 do n = n // p end
    end
    p = p + 1
  end
  return n == 1
end

local out = {}
for n = 1, 100 do
  if is_powerful(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
