local template = "Hello ${name}, you are ${age} years old. ${missing}"
local vars = { name = "Ada", age = 36 }

local rendered = template:gsub("%${(%w+)}", function(key)
  local v = vars[key]
  if v == nil then return nil end
  return tostring(v)
end)
print(rendered)

print(("hello world"):gsub("(%w+)", string.upper))
print(("a,b;c d"):gsub("[,; ]", "|"))
print(("abc"):gsub("", "-"))
print(("hello"):gsub("l", { l = "L" }))
print(("  trim me  "):match("^%s*(.-)%s*$") .. "|")

for k, v in ("a=1, b=2, c=3"):gmatch("(%w+)=(%w+)") do
  io.write(k, "->", v, " ")
end
print()
