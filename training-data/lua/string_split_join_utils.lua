local function split(s, sep)
  local parts = {}
  for piece in (s .. sep):gmatch("(.-)" .. sep:gsub("%p", "%%%0")) do
    parts[#parts + 1] = piece
  end
  return parts
end

local function join(parts, sep) return table.concat(parts, sep) end

local function trim(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end

local function startswith(s, p) return s:sub(1, #p) == p end

local p = split("a,b,,c", ",")
print(#p, join(p, "|"))
print(join(split("2024-03-15", "-"), "/"))
print("[" .. trim("   padded \t") .. "]")
print(startswith("hello", "he"), startswith("hello", "lo"))
print(join(split("one.two.three", "."), " "))
