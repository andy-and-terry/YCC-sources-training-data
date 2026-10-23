local people = {
  { name = "Cy", age = 25 },
  { name = "Ann", age = 30 },
  { name = "Bob", age = 25 },
}

table.sort(people, function(a, b)
  if a.age ~= b.age then return a.age < b.age end
  return a.name < b.name
end)

for _, p in ipairs(people) do
  print(p.name, p.age)
end

local nums = { 5, 2, 8, 1 }
table.sort(nums, function(a, b) return a > b end)
print(table.concat(nums, " "))
table.insert(nums, 2, 99)
print(table.concat(nums, " "), table.remove(nums))
