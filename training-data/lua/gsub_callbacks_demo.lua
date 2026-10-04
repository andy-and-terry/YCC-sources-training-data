local text = "the quick brown fox"

print((text:gsub("quick", "slow")))
print(text:gsub("o", "0"))
print(text:gsub("o", "0", 1))

print((text:gsub("%w+", string.upper)))
print((text:gsub("(%w)(%w*)", function(first, rest)
  return first:upper() .. rest
end)))

local vars = { name = "Ada", lang = "Lua" }
print((("Hello $name, welcome to $lang! $missing"):gsub("%$(%w+)", vars)))

print((("2024-03-15"):gsub("(%d+)-(%d+)-(%d+)", "%3/%2/%1")))
print((("hello world"):gsub("%w+", "<%0>")))
print((("  trim me  "):gsub("^%s+", ""):gsub("%s+$", "")))

local counts = {}
("a,b,a,c,a,b"):gsub("%a", function(ch)
  counts[ch] = (counts[ch] or 0) + 1
end)
print(counts.a, counts.b, counts.c)

print((("snake_case_name"):gsub("_(%a)", function(c) return c:upper() end)))
print((("CamelCaseName"):gsub("(%u)", function(c) return "_" .. c:lower() end)))
print((("x = 1, y = 2"):gsub("%s*=%s*", "=")))
