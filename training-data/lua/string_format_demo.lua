print(string.format("%d items", 42))
print(string.format("%5d|%-5d|%05d", 42, 42, 42))
print(string.format("%.2f", math.pi))
print(string.format("%8.3f|%-8.1f|", 3.14159, 2.5))
print(string.format("%x %X %o", 255, 255, 8))
print(string.format("%e", 12345.678))
print(string.format("%s and %s", "a", true))
print(string.format("%q", 'say "hi"\n'))
print(string.format("%10s|%-10s|", "right", "left"))
print(string.format("%.3s", "truncate"))
print(string.format("%c%c%c", 76, 117, 97))
print(string.format("%%"))
print(string.format("%g %g", 100000, 1e20))
print(string.format("%i", 7))

local rows = { { "apple", 1.5 }, { "kiwi", 12.25 } }
for _, r in ipairs(rows) do
  print(string.format("%-8s $%6.2f", r[1], r[2]))
end
