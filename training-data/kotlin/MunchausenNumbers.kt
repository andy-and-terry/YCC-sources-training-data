// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
fun power(d: Int): Int {
    var p = 1
    repeat(d) { p *= d }
    return if (d == 0) 0 else p
}

fun isMunchausen(n: Int): Boolean = n.toString().sumOf { power(it - '0') } == n

fun main() {
    println((1 until 5000).filter(::isMunchausen).joinToString(" "))
}
