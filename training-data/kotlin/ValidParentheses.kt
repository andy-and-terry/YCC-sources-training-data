fun isValid(s: String): Boolean {
    val stack = ArrayDeque<Char>()
    val pairs = mapOf(')' to '(', ']' to '[', '}' to '{')
    for (ch in s) {
        if (ch in pairs.values) {
            stack.addLast(ch)
        } else if (ch in pairs.keys) {
            if (stack.isEmpty() || stack.removeLast() != pairs[ch]) return false
        }
    }
    return stack.isEmpty()
}

fun main() {
    println(isValid("({[]})"))
    println(isValid("(]"))
}
