fun isHappy(start: Int): Boolean {
    val seen = mutableSetOf<Int>()
    var n = start
    while (n != 1 && seen.add(n)) {
        n = n.toString().sumOf { (it - '0') * (it - '0') }
    }
    return n == 1
}

fun main() {
    println(generateSequence(1) { it + 1 }.filter(::isHappy).take(8).toList())
    // [1, 7, 10, 13, 19, 23, 28, 31]
}
