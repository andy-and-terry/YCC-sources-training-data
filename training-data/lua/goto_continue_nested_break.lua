for i = 1, 5 do
  if i % 2 == 0 then goto continue end
  io.write(i, " ")
  ::continue::
end
print()
for i = 1, 3 do
  for j = 1, 3 do
    if i * j == 4 then goto done end
    io.write(i * j, " ")
  end
end
::done::
print()
local i = 0
repeat local k = i * 2; i = i + 1 until k >= 6
print(i)
local n = 10
while true do n = n - 3; if n < 0 then break end end
print(n)
for x = 10, 1, -4 do io.write(x, " ") end
print()
for k, v in pairs({ a = 1 }) do print(k, v) end
