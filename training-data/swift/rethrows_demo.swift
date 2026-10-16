enum ParseError: Error {
    case notANumber(String)
}

func transformAll(_ values: [String], using transform: (String) throws -> Int) rethrows -> [Int] {
    var result: [Int] = []
    for v in values {
        result.append(try transform(v))
    }
    return result
}

let safe = transformAll(["a", "bb", "ccc"]) { $0.count }
print(safe)

do {
    let parsed = try transformAll(["1", "2", "x"]) { s in
        guard let n = Int(s) else { throw ParseError.notANumber(s) }
        return n
    }
    print(parsed)
} catch {
    print("failed: \(error)")
}
