-- Integer (1..3999) to Roman numeral using a greedy table.
local table_ = {
  {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"},
  {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"},
}

local function to_roman(n)
  local out = {}
  for _, pair in ipairs(table_) do
    while n >= pair[1] do
      out[#out + 1] = pair[2]
      n = n - pair[1]
    end
  end
  return table.concat(out)
end

print(to_roman(1994), to_roman(58))
