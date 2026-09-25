local function abbreviate(phrase)
  local out = {}
  for word in phrase:gsub("-", " "):gmatch("[%a']+") do
    out[#out + 1] = word:match("%a"):upper()
  end
  return table.concat(out)
end

print(abbreviate("Portable Network Graphics"))
print(abbreviate("Complementary metal-oxide semiconductor"))
