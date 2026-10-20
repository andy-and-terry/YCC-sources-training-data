local s = "Hello, World 123"
print(s:len(), s:upper(), s:lower(), s:reverse(), s:sub(1, 5), s:sub(-3))
print(s:find("World"), s:find("%d+"), s:match("(%a+), (%a+)"))
print(s:gsub("%d", "#"), s:gsub("o", "0", 1))
for w in s:gmatch("%a+") do io.write("[", w, "]") end
print()
print(("%5.2f|%-5s|%05d|%x|%q"):format(3.14159, "ab", 42, 255, "quoted"))
print(("x"):rep(3, ","), ("abc"):byte(1, -1))
print(string.char(72, 105), ("  trim  "):match("^%s*(.-)%s*$") .. "|")
print(("key=value"):match("^(%w+)=(%w+)$"))
print(("2024-03-05"):gsub("(%d+)-(%d+)-(%d+)", "%3/%2/%1"))
print(("a,b,,c"):find(",", 1, true), tostring(12):len(), tonumber("0x1F"), tonumber("z", 36))
