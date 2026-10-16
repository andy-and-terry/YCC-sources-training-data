struct Email {
    let address: String

    init?(_ raw: String) {
        let parts = raw.split(separator: "@")
        guard parts.count == 2, parts[1].contains(".") else { return nil }
        address = raw.lowercased()
    }
}

enum Direction: String {
    case north, south, east, west
}

print(Email("Ada@Example.com")?.address ?? "invalid")
print(Email("not-an-email")?.address ?? "invalid")
print(Direction(rawValue: "east") as Any)
print(Direction(rawValue: "up") as Any)
