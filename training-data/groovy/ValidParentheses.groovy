def isValid(String s) {
    def stack = []
    def pairs = [')': '(', ']': '[', '}': '{']
    for (c in s) {
        if (c in ['(', '[', '{']) {
            stack.push(c)
        } else if (c in [')', ']', '}']) {
            if (stack.isEmpty() || stack.pop() != pairs[c]) {
                return false
            }
        }
    }
    return stack.isEmpty()
}

println isValid('{[()]}')
println isValid('{[(])}')
