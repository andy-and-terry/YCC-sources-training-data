local function range(n)
  return coroutine.wrap(function()
    for i = 1, n do coroutine.yield(i) end
  end)
end
for v in range(4) do io.write(v, " ") end
print()
