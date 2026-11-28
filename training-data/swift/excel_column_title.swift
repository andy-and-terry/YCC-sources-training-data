func columnTitle(_ number: Int) -> String {
    var n = number
    var chars: [Character] = []
    while n > 0 {
        n -= 1
        chars.append(Character(UnicodeScalar(65 + n % 26)!))
        n /= 26
    }
    return String(chars.reversed())
}

print(columnTitle(28), columnTitle(701)) // AB ZY
