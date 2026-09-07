local function encode(s)
  local result = {}
  local i = 1
  while i <= #s do
    local char = s:sub(i, i)
    local count = 1
    while i + count <= #s and s:sub(i + count, i + count) == char do
      count = count + 1
    end
    table.insert(result, count .. char)
    i = i + count
  end
  return table.concat(result)
end

local function decode(s)
  local result = {}
  for count, char in s:gmatch("(%d+)(%a)") do
    table.insert(result, char:rep(tonumber(count)))
  end
  return table.concat(result)
end

local encoded = encode("aaabbbcccca")
print(encoded)
print(decode(encoded))
