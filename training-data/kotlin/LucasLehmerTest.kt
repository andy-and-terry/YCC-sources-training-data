fun lucasLehmer(p: Int): Boolean {
    if (p == 2) return true
    val m = (1L shl p) - 1
    var s = 4L
    repeat(p - 2) {
        s = (s * s - 2) % m
    }
    return s == 0L
}

fun main() {
    println(listOf(2, 3, 5, 7, 11, 13, 17, 19).filter { lucasLehmer(it) }.joinToString(" "))
}
