enum HammingError: Error { case unequalLength }

func hamming(_ a: String, _ b: String) throws -> Int {
    guard a.count == b.count else { throw HammingError.unequalLength }
    return zip(a, b).filter { $0 != $1 }.count
}

do {
    print(try hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))
    _ = try hamming("AB", "A")
} catch {
    print("error:", error)
}
