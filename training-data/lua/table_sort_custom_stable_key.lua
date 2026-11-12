local people = { { n = "b", a = 30 }, { n = "a", a = 30 }, { n = "c", a = 25 } }
table.sort(people, function(x, y) if x.a ~= y.a then return x.a < y.a end return x.n < y.n end)
for _, p in ipairs(people) do print(p.n, p.a) end
