func isValidParentheses(_ s: String) -> Bool {
    var stack: [Character] = []
    let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    for ch in s {
        if let opening = pairs[ch] {
            if stack.popLast() != opening {
                return false
            }
        } else {
            stack.append(ch)
        }
    }
    return stack.isEmpty
}

print(isValidParentheses("({[]})"))
print(isValidParentheses("(]"))
