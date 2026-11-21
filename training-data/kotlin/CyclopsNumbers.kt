// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
fun isCyclops(n: Int): Boolean {
    val s = n.toString()
    return s.length % 2 == 1 && s[s.length / 2] == '0' && s.count { it == '0' } == 1
}

fun main() {
    println((1 until 100000).count(::isCyclops))
}
