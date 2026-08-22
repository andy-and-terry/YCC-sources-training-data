func isAnagram(_ a: String, _ b: String) -> Bool {
    guard a.count == b.count else { return false }
    return a.sorted() == b.sorted()
}

print(isAnagram("listen", "silent"))
print(isAnagram("hello", "world"))
