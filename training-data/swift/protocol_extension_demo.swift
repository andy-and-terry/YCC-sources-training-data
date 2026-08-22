protocol Greetable {
    var name: String { get }
    func greet() -> String
}

extension Greetable {
    func greet() -> String {
        "Hello, \(name)!"
    }
}

struct Person: Greetable {
    let name: String
}

struct Robot: Greetable {
    let name: String
    func greet() -> String {
        "BEEP BOOP \(name)"
    }
}

let entities: [Greetable] = [Person(name: "Ada"), Robot(name: "R2")]
for e in entities {
    print(e.greet())
}
