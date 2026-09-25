local function is_isogram(word)
  local seen = {}
  for c in word:lower():gmatch("%a") do
    if seen[c] then return false end
    seen[c] = true
  end
  return true
end

for _, w in ipairs({ "lumberjacks", "background", "six-year-old", "isograms" }) do
  print(w, is_isogram(w))
end
