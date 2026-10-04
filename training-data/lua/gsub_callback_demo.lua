local s = "hello world from lua"

print((s:gsub("%w+", string.upper)))
print((s:gsub("(%w+) (%w+)", "%2 %1")))
print((s:gsub("o", "0", 2)))
print(s:gsub("l", "L"))

local vars = { name = "Ada", lang = "Lua" }
print((("Hi $name, welcome to $lang, $missing"):gsub("%$(%w+)", vars)))

print((("3 + 4 = ?"):gsub("(%d+) %+ (%d+) = %?", function(a, b)
  return a .. " + " .. b .. " = " .. (tonumber(a) + tonumber(b))
end)))

print((("snake_case_name"):gsub("_(%a)", function(c) return c:upper() end)))
print((("CamelCaseName"):gsub("(%u)", function(c) return "_" .. c:lower() end):sub(2)))

print((("  trim me  "):gsub("^%s+", ""):gsub("%s+$", "")))
print((("a.b.c"):gsub("%.", "/")))
print((("100%"):gsub("%%", " percent")))
print((("x"):gsub("", "-")))

local count = select(2, ("banana"):gsub("a", ""))
print(count)

print((("abc"):gsub(".", { a = "1", b = false, c = false })))
