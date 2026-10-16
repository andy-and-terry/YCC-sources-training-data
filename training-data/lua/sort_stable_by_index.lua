-- table.sort is not stable; decorate with the original index to get stability
local people = {
  { name = "Ann", age = 30 }, { name = "Bob", age = 25 },
  { name = "Cid", age = 30 }, { name = "Dee", age = 25 },
}
for i, p in ipairs(people) do p.idx = i end

table.sort(people, function(a, b)
  if a.age ~= b.age then return a.age < b.age end
  return a.idx < b.idx
end)

for _, p in ipairs(people) do print(p.age, p.name) end
