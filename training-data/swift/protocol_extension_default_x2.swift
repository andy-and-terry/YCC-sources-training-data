protocol Greeter { var name: String { get } }
extension Greeter { func greet() -> String { "Hello, \(name)" } }
struct P: Greeter { let name: String }
print(P(name: "Ann").greet())
