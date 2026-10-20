class Person {
    let name: String
    weak var friend: Person?
    init(_ n: String) { name = n; print("init \(n)") }
    deinit { print("deinit \(name)") }
}
class Card { unowned let owner: Person; init(_ o: Person) { owner = o } }

do {
    let a = Person("a"), b = Person("b")
    a.friend = b; b.friend = a
    let c = Card(a)
    print(c.owner.name, a.friend?.name ?? "nil")
}
print("after scope")
var strong: Person? = Person("tmp")
weak var w = strong
strong = nil
print(w == nil)
