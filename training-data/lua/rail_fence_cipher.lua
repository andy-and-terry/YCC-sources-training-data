local function encode(text, rails)
  local rows = {}
  for i = 1, rails do rows[i] = {} end
  local r, step = 1, 1
  for ch in text:gmatch(".") do
    table.insert(rows[r], ch)
    if r == 1 then step = 1 elseif r == rails then step = -1 end
    r = r + step
  end
  local out = {}
  for i = 1, rails do out[#out + 1] = table.concat(rows[i]) end
  return table.concat(out)
end

print(encode("WEAREDISCOVERED", 3))
