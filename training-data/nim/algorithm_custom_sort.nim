import std/algorithm

type
  Person = object
    name: string
    age: int

var people = @[
  Person(name: "Carol", age: 35),
  Person(name: "Alice", age: 30),
  Person(name: "Bob", age: 30)
]

proc byAge(a, b: Person): int =
  cmp(a.age, b.age)

people.sort(byAge)
for p in people:
  echo p.name, " ", p.age

people.sort(proc (a, b: Person): int =
  if a.age != b.age: cmp(a.age, b.age)
  else: cmp(a.name, b.name)
)
echo "---"
for p in people:
  echo p.name, " ", p.age

echo people.reversed
