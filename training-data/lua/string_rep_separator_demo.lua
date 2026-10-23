-- string.rep with a separator, useful for banners and padding.

print(("ab"):rep(3))
print(("ab"):rep(3, "-"))
print(("x"):rep(0) == "")
print(("x"):rep(-1) == "")

-- Draw a simple box
local function box(text, pad)
  pad = pad or 1
  local inner = #text + pad * 2
  local line = "+" .. ("-"):rep(inner) .. "+"
  print(line)
  print("|" .. (" "):rep(pad) .. text .. (" "):rep(pad) .. "|")
  print(line)
end
box("hello", 2)

-- Left/right padding helpers
local function lpad(s, w, ch) return (ch or " "):rep(w - #s) .. s end
local function rpad(s, w, ch) return s .. (ch or " "):rep(w - #s) end
print(lpad("7", 4, "0"), "[" .. rpad("ab", 5) .. "]")

-- Build a comma separated placeholder list for SQL-style queries
local function placeholders(n) return ("?"):rep(n, ", ") end
print(placeholders(4))

-- Indented tree output
for depth = 0, 3 do
  print(("  "):rep(depth) .. "node" .. depth)
end
