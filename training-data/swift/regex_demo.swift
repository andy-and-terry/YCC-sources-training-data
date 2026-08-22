import Foundation

func extractEmails(_ text: String) -> [String] {
    let pattern = "[\\w.+-]+@[\\w-]+\\.[\\w.-]+"
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(text.startIndex..., in: text)
    return regex.matches(in: text, range: range).map {
        String(text[Range($0.range, in: text)!])
    }
}

let text = "Contact us at support@example.com or sales@example.org."
print(extractEmails(text))
