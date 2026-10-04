let a: Set = [1, 2, 3, 4, 5]
let b: Set = [4, 5, 6, 7]

print(a.union(b).sorted())
print(a.intersection(b).sorted())
print(a.subtracting(b).sorted())
print(a.symmetricDifference(b).sorted())

print(a.isSubset(of: [1, 2, 3, 4, 5, 6]))
print(Set([1, 2]).isStrictSubset(of: a))
print(a.isSuperset(of: [1, 2]))
print(a.isDisjoint(with: [8, 9]))

var seen = Set<String>()
var duplicates: [String] = []
for word in ["a", "b", "a", "c", "b"] {
    if !seen.insert(word).inserted {
        duplicates.append(word)
    }
}
print(duplicates)

var s: Set = [1, 2, 3]
s.formUnion([3, 4])
s.remove(1)
print(s.sorted(), s.contains(4), s.count)
print(s.update(with: 9) as Int?)

func uniqued<T: Hashable>(_ items: [T]) -> [T] {
    var seen = Set<T>()
    return items.filter { seen.insert($0).inserted }
}
print(uniqued([3, 1, 3, 2, 1]))

struct Tag: Hashable {
    let name: String
    let weight: Int
}
let tags: Set = [Tag(name: "x", weight: 1), Tag(name: "x", weight: 1), Tag(name: "y", weight: 2)]
print(tags.count)
