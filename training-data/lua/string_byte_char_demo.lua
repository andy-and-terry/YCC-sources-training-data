print(("A"):byte(), ("abc"):byte(1, -1))
print(string.char(72, 101, 108, 108, 111))

local function caesar(s, shift)
  return (s:gsub("%a", function(c)
    local base = c:match("%l") and 97 or 65
    return string.char((c:byte() - base + shift) % 26 + base)
  end))
end
print(caesar("Hello, World!", 3))
print(caesar(caesar("Hello, World!", 3), -3))

local function to_binary(n)
  local bits = {}
  repeat
    table.insert(bits, 1, n % 2)
    n = n // 2
  until n == 0
  return table.concat(bits)
end
print(to_binary(10), to_binary(255))

local function checksum(s)
  local sum = 0
  for i = 1, #s do
    sum = (sum + s:byte(i)) % 256
  end
  return sum
end
print(checksum("checksum me"))

print(("héllo"):len(), utf8.len("héllo"))
for pos, code in utf8.codes("hé!") do
  io.write(pos, ":", code, " ")
end
print()
print(utf8.char(72, 233, 8364))

print(("abc"):rep(3, "-"), ("abc"):reverse(), ("MiXeD"):lower(), ("MiXeD"):upper())
print(("hello"):sub(2, -2), ("hello"):sub(-3))
