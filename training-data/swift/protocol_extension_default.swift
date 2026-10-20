protocol Greeter {
    var name: String { get }
}

extension Greeter {
    func greet() -> String { "Hello, \(name)!" }
}

struct Person: Greeter { let name: String }

print(Person(name: "Ada").greet())
