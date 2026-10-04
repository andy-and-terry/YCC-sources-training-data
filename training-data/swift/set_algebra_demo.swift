let a: Set<Int> = [1, 2, 3, 4, 5]
let b: Set<Int> = [4, 5, 6, 7]

print(a.union(b).sorted())
print(a.intersection(b).sorted())
print(a.subtracting(b).sorted())
print(a.symmetricDifference(b).sorted())

let small: Set = [1, 2]
print(small.isSubset(of: a))
print(a.isSuperset(of: small))
print(a.isDisjoint(with: [10, 11]))

var seen = Set<String>()
for item in ["x", "y", "x", "z", "y"] {
    let (inserted, _) = seen.insert(item)
    if !inserted {
        print("duplicate: \(item)")
    }
}
