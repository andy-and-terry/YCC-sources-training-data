print(string.format("%d items", 42))
print(string.format("[%5d] [%-5d] [%05d]", 42, 42, 42))
print(string.format("%.3f %10.2f %e", math.pi, 2.71828, 12345.678))
print(string.format("%s and %s", "left", "right"))
print(string.format("[%10s] [%-10s] [%.3s]", "right", "left", "truncate"))
print(string.format("%x %X %o", 255, 255, 8))
print(string.format("%c%c%c", 76, 117, 97))
print(string.format("%q", 'say "hi"\nnow'))
print(string.format("%5.1f%%", 99.5))
print(string.format("%g %g %g", 100, 0.0001, 1e20))
print(string.format("%s %s %s", nil, true, {} ~= nil))

local rows = { { "apple", 3, 0.5 }, { "banana", 12, 0.25 }, { "kiwi", 7, 1.125 } }
for _, r in ipairs(rows) do
  print(string.format("%-8s %3d x %5.2f = %6.2f", r[1], r[2], r[3], r[2] * r[3]))
end

print(("%d-%d"):format(1, 2))
print(#string.format("%10s", "x"))
