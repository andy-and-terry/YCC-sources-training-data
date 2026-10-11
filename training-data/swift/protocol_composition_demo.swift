protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    let name: String
    let age: Int
}

func greet(_ who: Named & Aged) {
    print("\(who.name) is \(who.age) years old")
}

func oldest(_ people: [Named & Aged]) -> (Named & Aged)? {
    people.max { $0.age < $1.age }
}

greet(Person(name: "Ada", age: 36))
if let o = oldest([Person(name: "A", age: 20), Person(name: "B", age: 45)]) {
    print("oldest: \(o.name)")
}
