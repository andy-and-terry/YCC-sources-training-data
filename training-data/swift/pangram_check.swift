func isPangram(_ s: String) -> Bool {
    Set(s.lowercased().filter { ("a"..."z").contains($0) }).count == 26
}

print(isPangram("The quick brown fox jumps over the lazy dog"))
print(isPangram("Hello world"))
