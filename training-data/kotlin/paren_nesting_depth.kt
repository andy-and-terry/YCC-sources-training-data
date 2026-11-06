// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
fun maxDepth(s: String): Int {
    var depth = 0
    var best = 0
    for (ch in s) {
        when (ch) {
            '(' -> best = maxOf(best, ++depth)
            ')' -> if (--depth < 0) return -1
        }
    }
    return if (depth == 0) best else -1
}

fun main() {
    println("${maxDepth("(1+(2*(3)))")} ${maxDepth("(()")}")
}
