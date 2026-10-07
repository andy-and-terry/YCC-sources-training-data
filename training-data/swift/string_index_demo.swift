import Foundation

let text = "Hello, Swift!"

let start = text.startIndex
let fifth = text.index(start, offsetBy: 4)
print(text[fifth])

let range = text.index(start, offsetBy: 7)..<text.index(text.endIndex, offsetBy: -1)
print(text[range])

if let comma = text.firstIndex(of: ",") {
    print(text[..<comma])
    print(text[text.index(after: comma)...].trimmingCharacters(in: .whitespaces))
}

let emoji = "a\u{1F600}b"
print(emoji.count, emoji.utf8.count)
print(String(text.reversed()))
