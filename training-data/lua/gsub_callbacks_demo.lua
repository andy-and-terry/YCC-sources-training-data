-- string.gsub with a string, table or function replacement.
print(("hello world"):gsub("o", "0"))
print(("hello world"):gsub("o", "0", 1))

print(("$name is $age"):gsub("%$(%w+)", { name = "Ann", age = 30 }))

print(("a1b22c333"):gsub("%d+", function(d) return "<" .. #d .. ">" end))

print(("hello world"):gsub("(%w+) (%w+)", "%2 %1"))
print(("abc"):gsub("", "-"))
print(("  trim me  "):gsub("^%s+", ""):gsub("%s+$", ""))

local trimmed = ("  trim me  "):match("^%s*(.-)%s*$")
print("[" .. trimmed .. "]")

local words = {}
for w in ("one,two,,three"):gmatch("([^,]*)") do words[#words + 1] = w end
print(#words, table.concat(words, "|"))

print(("camelCaseString"):gsub("%u", function(c) return "_" .. c:lower() end))
print(("x"):rep(3, "-"))
print(("%d"):gsub("%%d", "N"))
