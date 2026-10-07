let text = "Hello, Swift!"

let start = text.startIndex
let fifth = text.index(start, offsetBy: 4)
print(text[fifth])
print(text[start...fifth])

let comma = text.firstIndex(of: ",")!
let before = text[..<comma]
let after = text[text.index(after: comma)...].trimmingPrefix(" ")
print(before, after)
print(type(of: before))

let owned = String(before)
print(owned.count, owned.uppercased())

print(text.prefix(5), text.suffix(6))
print(text.dropFirst(7).dropLast())
print(text.reversed().map(String.init).joined())

let emoji = "a\u{1F600}b"
print(emoji.count, emoji.utf8.count, emoji.unicodeScalars.count)

for (offset, char) in text.enumerated() where char.isUppercase {
    print("uppercase \(char) at \(offset)")
}

var mutable = "abc"
mutable.insert("X", at: mutable.index(after: mutable.startIndex))
mutable.remove(at: mutable.index(before: mutable.endIndex))
print(mutable)
print(text.hasPrefix("Hello"), text.hasSuffix("?"), text.contains("Swift"))
print(text.split(separator: " ").map { $0.count })
