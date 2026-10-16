local function reverseWords(s)
  local words = {}
  for w in s:gmatch("%S+") do
    words[#words + 1] = w
  end
  local out = {}
  for i = #words, 1, -1 do
    out[#out + 1] = words[i]
  end
  return table.concat(out, " ")
end

print(reverseWords("the quick brown fox"))
print(("lua"):reverse())
