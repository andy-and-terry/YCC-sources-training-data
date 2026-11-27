local function fletcher16(s)
  local s1, s2 = 0, 0
  for i = 1, #s do
    s1 = (s1 + s:byte(i)) % 255
    s2 = (s2 + s1) % 255
  end
  return (s2 << 8) | s1
end

print(string.format("%x", fletcher16("abcde")))
