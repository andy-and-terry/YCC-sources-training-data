enum FileError: Error {
    case notFound
}

func readConfig(_ name: String) throws -> String {
    print("opening \(name)")
    defer { print("closing \(name)") }

    guard name == "config.toml" else {
        throw FileError.notFound
    }

    return "contents of \(name)"
}

func processOrder(quantity: Int, price: Double) -> String {
    guard quantity > 0 else {
        return "invalid quantity"
    }
    guard price >= 0 else {
        return "invalid price"
    }

    var log: [String] = []
    defer { print(log.joined(separator: ", ")) }

    log.append("validated order")
    log.append("charged $\(Double(quantity) * price)")
    return "order processed"
}

if let contents = try? readConfig("config.toml") {
    print(contents)
}

do {
    _ = try readConfig("missing.toml")
} catch {
    print("failed: \(error)")
}

print(processOrder(quantity: 3, price: 9.99))
print(processOrder(quantity: -1, price: 9.99))
