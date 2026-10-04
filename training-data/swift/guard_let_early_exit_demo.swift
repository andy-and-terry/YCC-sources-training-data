struct User {
    let name: String
    let age: Int
    let email: String
}

func parseUser(_ fields: [String: String]) -> User? {
    guard let name = fields["name"], !name.isEmpty else {
        print("missing name")
        return nil
    }
    guard let ageText = fields["age"], let age = Int(ageText), age >= 0 else {
        print("invalid age")
        return nil
    }
    guard let email = fields["email"], email.contains("@") else {
        print("invalid email")
        return nil
    }
    return User(name: name, age: age, email: email)
}

print(parseUser(["name": "Ann", "age": "30", "email": "ann@example.com"]) as Any)
print(parseUser(["age": "30"]) as Any)
print(parseUser(["name": "Bob", "age": "x"]) as Any)
print(parseUser(["name": "Cy", "age": "5", "email": "nope"]) as Any)

func firstEvenSquare(in numbers: [Int]) -> Int? {
    guard let even = numbers.first(where: { $0 % 2 == 0 }) else { return nil }
    return even * even
}
print(firstEvenSquare(in: [1, 3, 6, 8]) ?? -1)
print(firstEvenSquare(in: [1, 3]) ?? -1)

func process(_ values: [Int?]) {
    for value in values {
        guard let v = value else { continue }
        guard v > 0 else { break }
        print("processing", v)
    }
}
process([1, nil, 2, -1, 5])

let maybe: Int? = 7
if let m = maybe, m > 5 { print("big", m) }
if case let n? = maybe { print("pattern", n) }
if let maybe { print("shorthand", maybe) }
