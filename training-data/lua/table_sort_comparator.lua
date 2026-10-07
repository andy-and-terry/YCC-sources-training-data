local people = {
  { name = "Alice", age = 30 },
  { name = "Bob", age = 25 },
  { name = "Carol", age = 35 },
}

table.sort(people, function(a, b)
  return a.age < b.age
end)

for _, p in ipairs(people) do
  print(p.name, p.age)
end

local numbers = { 5, 2, 9, 1, 7 }
table.sort(numbers, function(a, b) return a > b end)
print(table.concat(numbers, ", "))
