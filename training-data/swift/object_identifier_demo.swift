// ObjectIdentifier gives reference identity; === compares the same thing.
final class Node {
    let name: String
    init(_ name: String) { self.name = name }
}

let a = Node("a")
let b = Node("b")
let alias = a

print(ObjectIdentifier(a) == ObjectIdentifier(alias))
print(ObjectIdentifier(a) == ObjectIdentifier(b))
print(a === alias, a === b)

// Use identity as a dictionary key, without requiring Node to be Hashable.
var visits: [ObjectIdentifier: Int] = [:]
for n in [a, b, a, alias, b] {
    visits[ObjectIdentifier(n), default: 0] += 1
}
print("a visited \(visits[ObjectIdentifier(a)]!) times")
print("b visited \(visits[ObjectIdentifier(b)]!) times")

// Identity-based set of already seen objects.
var seen = Set<ObjectIdentifier>()
for n in [a, b, alias] {
    let inserted = seen.insert(ObjectIdentifier(n)).inserted
    print("\(n.name): \(inserted ? "new" : "duplicate")")
}
