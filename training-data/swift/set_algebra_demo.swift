let swift: Set<String> = ["closures", "generics", "protocols", "optionals"]
let kotlin: Set<String> = ["closures", "generics", "coroutines", "optionals"]

print(swift.intersection(kotlin).sorted())
print(swift.union(kotlin).sorted())
print(swift.subtracting(kotlin).sorted())
print(swift.symmetricDifference(kotlin).sorted())

let core: Set = ["closures", "generics"]
print(core.isSubset(of: swift))
print(swift.isSuperset(of: core))
print(swift.isDisjoint(with: ["coroutines"]))

var seen = Set<Int>()
let numbers = [3, 1, 3, 2, 1]
let unique = numbers.filter { seen.insert($0).inserted }
print(unique)
