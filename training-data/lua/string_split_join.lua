local function split(str, sep)
  local parts = {}
  for piece in (str .. sep):gmatch("(.-)" .. sep:gsub("%p", "%%%0")) do
    parts[#parts + 1] = piece
  end
  return parts
end

local fields = split("alpha,beta,,gamma", ",")
print(#fields, table.concat(fields, "|"))

local function splitWords(str)
  local words = {}
  for w in str:gmatch("%S+") do words[#words + 1] = w end
  return words
end
print(table.concat(splitWords("  many   spaced  words "), "_"))

local function join(list, sep)
  return table.concat(list, sep)
end
print(join({ "a", "b", "c" }, " -> "))

local function splitOnce(str, sep)
  local i, j = str:find(sep, 1, true)
  if not i then return str end
  return str:sub(1, i - 1), str:sub(j + 1)
end
print(splitOnce("key=value=more", "="))

local kv = {}
for k, v in ("a=1;b=2;c=3"):gmatch("(%w+)=(%w+)") do
  kv[k] = tonumber(v)
end
print(kv.a + kv.b + kv.c)

local chars = {}
for ch in ("héllo"):gmatch(utf8.charpattern) do chars[#chars + 1] = ch end
print(#chars, #"héllo")
print(("a b c"):rep(2, " | "))
