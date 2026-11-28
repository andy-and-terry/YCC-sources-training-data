local function bitap(text, pat)
  local masks = {}
  for i = 1, #pat do
    local c = pat:byte(i)
    masks[c] = (masks[c] or 0) | (1 << (i - 1))
  end
  local state, goal = 0, 1 << (#pat - 1)
  for i = 1, #text do
    state = ((state << 1) | 1) & (masks[text:byte(i)] or 0)
    if state & goal ~= 0 then return i - #pat end
  end
  return -1
end

print(bitap("the quick brown fox", "brown"))
