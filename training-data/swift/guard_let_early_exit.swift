struct User {
    let name: String
    let age: Int
}

func parseUser(_ input: [String: String]) -> User? {
    guard let name = input["name"], !name.isEmpty else {
        print("missing name")
        return nil
    }
    guard let ageText = input["age"], let age = Int(ageText), age >= 0 else {
        print("invalid age for \(name)")
        return nil
    }
    return User(name: name, age: age)
}

let inputs: [[String: String]] = [
    ["name": "Ada", "age": "36"],
    ["name": "", "age": "20"],
    ["name": "Bob", "age": "abc"],
]

for input in inputs {
    if let user = parseUser(input) {
        print("parsed \(user.name), \(user.age)")
    }
}

let value: Int? = 5
if case let x? = value, x > 3 { print("big \(x)") }
