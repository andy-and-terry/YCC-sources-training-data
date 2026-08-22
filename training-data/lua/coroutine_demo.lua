local function counter()
  local i = 0
  while true do
    i = i + 1
    coroutine.yield(i)
  end
end

local co = coroutine.create(counter)

for _ = 1, 5 do
  local ok, value = coroutine.resume(co)
  io.write(value, " ")
end
io.write("\n")
