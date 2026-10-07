fun luhnValid(input: String): Boolean {
    val s = input.replace(" ", "")
    if (s.length < 2 || !s.all(Char::isDigit)) return false
    val sum = s.reversed().mapIndexed { i, c ->
        val d = c.digitToInt()
        if (i % 2 == 1) (d * 2).let { if (it > 9) it - 9 else it } else d
    }.sum()
    return sum % 10 == 0
}

fun main() {
    println("${luhnValid("4539 3195 0343 6467")} ${luhnValid("8273 1232 7352 0569")}")
}
