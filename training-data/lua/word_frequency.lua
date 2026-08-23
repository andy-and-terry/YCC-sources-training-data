local function word_frequency(text)
  local freq = {}
  for word in text:lower():gmatch("%a+") do
    freq[word] = (freq[word] or 0) + 1
  end
  return freq
end

local freq = word_frequency("the quick brown fox the lazy fox")
for word, count in pairs(freq) do
  print(word, count)
end
