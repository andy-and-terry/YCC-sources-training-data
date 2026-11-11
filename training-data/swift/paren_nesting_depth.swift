// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
func maxDepth(_ s: String) -> Int {
    var depth = 0, best = 0
    for ch in s {
        if ch == "(" {
            depth += 1
            best = max(best, depth)
        } else if ch == ")" {
            depth -= 1
            if depth < 0 { return -1 }
        }
    }
    return depth == 0 ? best : -1
}

print(maxDepth("(1+(2*(3)))"), maxDepth("(()"))
