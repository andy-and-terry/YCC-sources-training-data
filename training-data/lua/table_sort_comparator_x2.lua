local t = { { n = "b", v = 2 }, { n = "a", v = 2 }, { n = "c", v = 1 } }
table.sort(t, function(x, y) if x.v ~= y.v then return x.v < y.v end return x.n < y.n end)
for _, e in ipairs(t) do io.write(e.n, " ") end
print()
