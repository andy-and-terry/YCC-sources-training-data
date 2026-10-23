-- Base64 encoding and decoding using only 5.3+ integer bit operators.
local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local function encode(data)
  local out = {}
  for i = 1, #data, 3 do
    local a, b, c = data:byte(i, i + 2)
    local n = (a << 16) | ((b or 0) << 8) | (c or 0)
    local c1 = (n >> 18) & 63
    local c2 = (n >> 12) & 63
    local c3 = (n >> 6) & 63
    local c4 = n & 63
    out[#out + 1] = alphabet:sub(c1 + 1, c1 + 1) .. alphabet:sub(c2 + 1, c2 + 1)
      .. (b and alphabet:sub(c3 + 1, c3 + 1) or "=")
      .. (c and alphabet:sub(c4 + 1, c4 + 1) or "=")
  end
  return table.concat(out)
end

local lookup = {}
for i = 1, #alphabet do lookup[alphabet:byte(i)] = i - 1 end

local function decode(text)
  text = text:gsub("[^%w%+/=]", "")
  local out = {}
  for i = 1, #text, 4 do
    local chunk = text:sub(i, i + 3)
    local pad = select(2, chunk:gsub("=", ""))
    local n = 0
    for j = 1, 4 do
      local ch = chunk:byte(j)
      n = (n << 6) | (lookup[ch] or 0)
    end
    local bytes = string.char((n >> 16) & 255, (n >> 8) & 255, n & 255)
    out[#out + 1] = bytes:sub(1, 3 - pad)
  end
  return table.concat(out)
end

for _, s in ipairs({ "", "f", "fo", "foo", "foobar", "Hello, Lua!" }) do
  local e = encode(s)
  print(string.format("%-12s -> %-18s -> %s", s, e, decode(e)))
end
