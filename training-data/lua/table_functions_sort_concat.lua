local t = { 5, 2, 8, 1, 9 }
table.sort(t)
print(table.concat(t, ","))
table.sort(t, function(a, b) return a > b end)
print(table.concat(t, ","))
table.insert(t, 7)
table.insert(t, 1, 100)
print(table.concat(t, " "), table.remove(t), table.remove(t, 1), #t)
local words = { "pear", "fig", "banana" }
table.sort(words, function(a, b) return #a < #b end)
print(table.concat(words, " "))
print(table.concat(table.move({ 1, 2, 3 }, 1, 3, 2, { 0 }), ","))
local people = { { n = "b", a = 30 }, { n = "a", a = 30 }, { n = "c", a = 20 } }
table.sort(people, function(x, y) if x.a ~= y.a then return x.a < y.a end return x.n < y.n end)
for _, p in ipairs(people) do io.write(p.n, p.a, " ") end
print()
print(#{ 1, 2, nil, 4 } >= 2, next({}), type(table.unpack))
