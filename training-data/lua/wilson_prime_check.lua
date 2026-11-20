-- Wilson's theorem primality.
local function wilson(n)
  if n < 2 then return false end
  local f = 1
  for i = 2, n - 1 do f = f * i % n end
  return f == n - 1
end
local out = {}
for n = 2, 19 do if wilson(n) then out[#out + 1] = n end end
print(table.concat(out, " "))
