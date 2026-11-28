local function reverse_bits(value, width)
  width = width or 8
  local result = 0
  for _ = 1, width do
    result = (result << 1) | (value & 1)
    value = value >> 1
  end
  return result
end

for _, v in ipairs({ 1, 6, 13, 128 }) do
  print(v, reverse_bits(v)) -- 128 96 176 1
end
