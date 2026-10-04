print(string.format("|%5d|%-5d|%05d|", 42, 42, 42))
print(string.format("|%8.3f|%-8.1f|%e|", math.pi, 2.5, 12345.678))
print(string.format("|%10s|%-10s|%.3s|", "right", "left", "truncate"))
print(string.format("%x %X %o %c", 255, 255, 8, 65))
print(string.format("%q", 'say "hi"\n'))
print(string.format("%5.1f%%", 99.5))
print(string.format("%s %s %s", nil, true, {} ~= nil))
print(string.format("%g %g %g", 1e20, 0.1, 100))
print(string.format("%+d % d", 5, 5))
print(string.format("%#x %#o", 255, 8))

local rows = { { "apple", 1.5, 3 }, { "kiwi", 0.25, 12 }, { "watermelon", 3, 1 } }
for _, r in ipairs(rows) do
  print(string.format("%-12s $%6.2f x%3d", r[1], r[2], r[3]))
end

local function hexdump(s)
  return (s:gsub(".", function(c) return string.format("%02x ", c:byte()) end))
end
print(hexdump("Lua!"))
