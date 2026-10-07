-- The utf8 library (Lua 5.3+) handles multi-byte strings.
local s = "héllo wörld"
print(#s, utf8.len(s))

for p, c in utf8.codes("aé€") do
  print(p, c, utf8.char(c))
end

print(utf8.char(72, 228, 8364, 128512))
print(utf8.codepoint("€", 1))
print(utf8.offset("aé€x", 3))
print(utf8.len("\xff"))

for ch in ("日本語"):gmatch(utf8.charpattern) do io.write(ch, "|") end
print()

local function utf8_reverse(str)
  local chars = {}
  for _, c in utf8.codes(str) do table.insert(chars, 1, utf8.char(c)) end
  return table.concat(chars)
end
print(utf8_reverse("añb€"))

local function utf8_sub(str, i, j)
  local from = utf8.offset(str, i)
  local to = utf8.offset(str, j + 1) - 1
  return str:sub(from, to)
end
print(utf8_sub("héllo", 2, 4))
