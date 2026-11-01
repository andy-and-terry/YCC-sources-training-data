local people = { { n = "bo", a = 30 }, { n = "al", a = 25 }, { n = "cy", a = 30 } }
table.sort(people, function(x, y)
  if x.a ~= y.a then return x.a > y.a end
  return x.n < y.n
end)
for _, p in ipairs(people) do print(p.n, p.a) end
