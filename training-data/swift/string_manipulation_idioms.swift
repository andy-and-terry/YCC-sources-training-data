let text = "The quick brown fox"

let words = text.split(separator: " ")
print(words.map { $0.count })
print(words.map { String($0.reversed()) }.joined(separator: " "))
print(text.lowercased().filter { "aeiou".contains($0) }.count)

let idx = text.index(text.startIndex, offsetBy: 4)
print(text[idx...].prefix(5))
print(text.hasPrefix("The"), text.hasSuffix("dog"))

if let range = text.range(of: "brown") {
    print(text.replacingCharacters(in: range, with: "red"))
}

let title = words.map { $0.prefix(1).uppercased() + $0.dropFirst() }
print(title.joined(separator: " "))
print(String(repeating: "=", count: 10))
print("café".unicodeScalars.count, "café".count)
