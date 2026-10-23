local function hex_dump(s, width)
  width = width or 16
  for off = 1, #s, width do
    local chunk = s:sub(off, off + width - 1)
    local hex = chunk:gsub(".", function(c) return string.format("%02x ", c:byte()) end)
    local text = chunk:gsub("[^\32-\126]", ".")
    print(string.format("%08x  %-" .. width * 3 .. "s %s", off - 1, hex, text))
  end
end

hex_dump("Hello, Lua!\n\tBinary: \0\1\255")
