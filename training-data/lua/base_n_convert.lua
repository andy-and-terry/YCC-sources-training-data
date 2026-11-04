local digits = "0123456789abcdefghijklmnopqrstuvwxyz"

local function to_base(n, base)
  if n == 0 then return "0" end
  local out = {}
  while n > 0 do
    local d = n % base
    table.insert(out, 1, digits:sub(d + 1, d + 1))
    n = n // base
  end
  return table.concat(out)
end

for _, b in ipairs({ 2, 8, 16, 36 }) do
  print(("255 in base %d = %s"):format(b, to_base(255, b)))
end
print(tonumber("zz", 36), tonumber("9", 8))
