local function is_sphenic(n)
  local distinct, p = 0, 2
  while p * p <= n do
    if n % p == 0 then
      n = n // p
      if n % p == 0 then return false end
      distinct = distinct + 1
    end
    p = p + 1
  end
  if n > 1 then distinct = distinct + 1 end
  return distinct == 3
end

local out = {}
for n = 2, 79 do
  if is_sphenic(n) then out[#out + 1] = n end
end
print(table.concat(out, " "))
