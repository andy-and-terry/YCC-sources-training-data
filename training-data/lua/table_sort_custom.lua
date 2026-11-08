local items = {{n = "b", p = 3}, {n = "a", p = 3}, {n = "c", p = 1}}
table.sort(items, function(x, y)
  if x.p ~= y.p then return x.p > y.p end
  return x.n < y.n
end)
for _, it in ipairs(items) do io.write(it.n, it.p, " ") end
print()
