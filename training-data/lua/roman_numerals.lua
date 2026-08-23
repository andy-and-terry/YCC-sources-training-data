local function to_roman(n)
  local values = { 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 }
  local symbols = { "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" }
  local result = {}
  local remaining = n
  for i, v in ipairs(values) do
    while remaining >= v do
      table.insert(result, symbols[i])
      remaining = remaining - v
    end
  end
  return table.concat(result)
end

print(to_roman(1994))
