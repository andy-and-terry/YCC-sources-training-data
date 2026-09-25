local function decode(text)
  return (text:lower():gsub("[^%w]", ""):gsub("%a", function(c)
    return string.char(219 - c:byte())
  end))
end

local function encode(text)
  local t, parts = decode(text), {}
  for i = 1, #t, 5 do parts[#parts + 1] = t:sub(i, i + 4) end
  return table.concat(parts, " ")
end

local e = encode("The quick brown fox")
print(e, "->", decode(e))
