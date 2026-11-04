local suffixes = { [1] = "st", [2] = "nd", [3] = "rd" }

local function ordinal(n)
  local r100 = n % 100
  local s = (r100 >= 11 and r100 <= 13) and "th" or suffixes[n % 10] or "th"
  return n .. s
end

local out = {}
for _, n in ipairs({ 1, 2, 3, 4, 11, 12, 13, 21, 101, 111 }) do out[#out + 1] = ordinal(n) end
print(table.concat(out, " "))
