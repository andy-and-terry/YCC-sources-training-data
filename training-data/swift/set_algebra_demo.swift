let a: Set = [1, 2, 3, 4, 5]
let b: Set = [4, 5, 6, 7]

print(a.union(b).sorted())
print(a.intersection(b).sorted())
print(a.subtracting(b).sorted())
print(a.symmetricDifference(b).sorted())
print(a.isSubset(of: [1, 2, 3, 4, 5, 6]))
print(a.isDisjoint(with: [10, 11]))

var seen = Set<String>()
for word in ["a", "b", "a", "c", "b"] {
    let (inserted, _) = seen.insert(word)
    if !inserted { print("duplicate:", word) }
}
print(seen.count)
print(Array(Set([3, 1, 3, 2, 1])).sorted())
