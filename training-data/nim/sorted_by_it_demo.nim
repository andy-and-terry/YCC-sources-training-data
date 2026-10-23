import std/[algorithm, sequtils]

type Person = object
  name: string
  age: int

let people = @[
  Person(name: "Ada", age: 36),
  Person(name: "Linus", age: 28),
  Person(name: "Grace", age: 45),
  Person(name: "Alan", age: 41)
]

# sortedByIt injects each element as `it` into the key expression
let byAge = people.sortedByIt(it.age)
echo byAge.mapIt(it.name)

# Descending order via the `order` parameter
let byNameDesc = people.sortedByIt(it.name, Descending)
echo byNameDesc.mapIt(it.name)

# Multi-key sort: tuple keys compare lexicographically
let byLenThenName = people.sortedByIt((it.name.len, it.name))
echo byLenThenName.mapIt(it.name)

# In-place variant on a var seq
var copy = people
copy.sortByIt(-it.age)
echo copy.mapIt(it.name & ":" & $it.age)
