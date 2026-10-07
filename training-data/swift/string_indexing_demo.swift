import Foundation

let s = "Hello, Swift!"

let first = s[s.startIndex]
let last = s[s.index(before: s.endIndex)]
print(first, last)

let start = s.index(s.startIndex, offsetBy: 7)
let end = s.index(start, offsetBy: 5)
print(s[start..<end])

if let comma = s.firstIndex(of: ",") {
    print(s[..<comma], "|", s[s.index(after: comma)...].trimmingCharacters(in: .whitespaces))
}

let emoji = "a\u{1F600}b"
print(emoji.count, emoji.utf8.count, emoji.unicodeScalars.count)

print(String(s.reversed()))
print(s.prefix(5), s.suffix(6))
