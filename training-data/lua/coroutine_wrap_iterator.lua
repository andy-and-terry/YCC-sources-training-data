local function range(from, to, step)
  step = step or 1
  return coroutine.wrap(function()
    local i = from
    while (step > 0 and i <= to) or (step < 0 and i >= to) do
      coroutine.yield(i)
      i = i + step
    end
  end)
end

for i in range(1, 10, 2) do
  io.write(i, " ")
end
io.write("\n")

local squares = {}
for i in range(5, 1, -1) do
  table.insert(squares, i * i)
end
print(table.concat(squares, ", "))
