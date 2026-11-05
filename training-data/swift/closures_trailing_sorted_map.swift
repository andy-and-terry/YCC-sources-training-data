let people = [("ann", 30), ("bob", 25), ("cy", 30)]
let sorted = people.sorted { $0.1 != $1.1 ? $0.1 > $1.1 : $0.0 < $1.0 }
print(sorted)
print(people.map { $0.0.uppercased() })
print(people.reduce(0) { $0 + $1.1 })
