local function is_vowel(c) return c:match("[aeiou]") ~= nil end

local function pig_word(w)
  if is_vowel(w:sub(1, 1)) or w:sub(1, 2) == "xr" or w:sub(1, 2) == "yt" then return w .. "ay" end
  for i = 2, #w do
    local c = w:sub(i, i)
    if c == "u" and w:sub(i - 1, i - 1) == "q" then return w:sub(i + 1) .. w:sub(1, i) .. "ay" end
    if is_vowel(c) or c == "y" then return w:sub(i) .. w:sub(1, i - 1) .. "ay" end
  end
  return w .. "ay"
end

local out = {}
for w in ("quick fast run apple rhythm square"):gmatch("%S+") do out[#out + 1] = pig_word(w) end
print(table.concat(out, " "))
