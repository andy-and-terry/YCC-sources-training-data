func isPalindrome(_ s: String) -> Bool {
    let cleaned = s.lowercased().filter { $0.isLetter || $0.isNumber }
    return cleaned == String(cleaned.reversed())
}

print(isPalindrome("A man a plan a canal Panama"))
print(isPalindrome("hello"))
