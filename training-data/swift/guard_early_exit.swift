struct User {
    let name: String
    let age: Int
}

func parseUser(_ fields: [String: String]) -> User? {
    guard let name = fields["name"], !name.isEmpty else {
        print("missing name")
        return nil
    }
    guard let ageText = fields["age"], let age = Int(ageText), age >= 0 else {
        print("invalid age for \(name)")
        return nil
    }
    return User(name: name, age: age)
}

print(parseUser(["name": "Ann", "age": "30"]) as Any)
print(parseUser(["name": "Bob", "age": "abc"]) as Any)
print(parseUser(["age": "5"]) as Any)
