local people = {{n = "ann", a = 30}, {n = "bob", a = 25}, {n = "cy", a = 30}}
table.sort(people, function(x, y)
  if x.a ~= y.a then return x.a > y.a end
  return x.n < y.n
end)
for _, p in ipairs(people) do print(p.n, p.a) end
