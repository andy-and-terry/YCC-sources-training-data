-- string.gsub accepts a string, table, or function as the replacement.

local text = "Hello $name, you owe $amount dollars."

-- Table replacement: keys looked up from the captured name
local vars = { name = "Ada", amount = 42 }
print((text:gsub("%$(%w+)", vars)))

-- Function replacement: return nil/false to keep the original match
local filled = text:gsub("%$(%w+)", function(key)
  if key == "name" then return "Bob" end
end)
print(filled)

-- gsub also returns the number of substitutions
local out, n = ("a-b-c-d"):gsub("-", "+", 2)
print(out, n)

-- Back references in replacement strings
print(("john smith"):gsub("(%w+) (%w+)", "%2, %1"))

-- Title-case each word
local title = ("the quick brown fox"):gsub("(%a)(%a*)", function(first, rest)
  return first:upper() .. rest
end)
print(title)

-- Escape magic characters by prefixing with %
print((("1+1=2"):gsub("%+", "%%")))
