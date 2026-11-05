local function range(n)
  local i = 0
  return function()
    i = i + 1
    if i <= n then return i end
  end
end
for v in range(5) do io.write(v, " ") end
print()
