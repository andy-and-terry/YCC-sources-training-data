let vowels: Set<Character> = ["a", "e", "i", "o", "u"]

func pigWord(_ w: String) -> String {
    if let f = w.first, vowels.contains(f) || w.hasPrefix("xr") || w.hasPrefix("yt") {
        return w + "ay"
    }
    let chars = Array(w)
    for i in 1..<chars.count {
        if chars[i] == "u" && chars[i - 1] == "q" {
            return String(chars[(i + 1)...]) + String(chars[...i]) + "ay"
        }
        if vowels.contains(chars[i]) || chars[i] == "y" {
            return String(chars[i...]) + String(chars[..<i]) + "ay"
        }
    }
    return w + "ay"
}

print("quick fast run apple rhythm square".split(separator: " ").map { pigWord(String($0)) }.joined(separator: " "))
