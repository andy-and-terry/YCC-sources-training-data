local function gray_code(n)
  local out = {}
  for i = 0, (1 << n) - 1 do
    out[#out + 1] = i ~ (i >> 1)
  end
  return out
end

local function to_binary(x, width)
  local bits = {}
  for i = width - 1, 0, -1 do
    bits[#bits + 1] = (x >> i) & 1
  end
  return table.concat(bits)
end

for _, g in ipairs(gray_code(3)) do
  print(to_binary(g, 3))
end
