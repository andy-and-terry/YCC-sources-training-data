local s = "héllo"
print(#s, utf8.len(s))
for p, c in utf8.codes(s) do io.write(p, ":", c, " ") end
print()
print(utf8.char(72, 233, 8364))
