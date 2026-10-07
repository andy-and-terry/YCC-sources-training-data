fun squareDigitSum(n: Int): Int = n.toString().sumOf { it.digitToInt().let { d -> d * d } }

fun isHappy(n: Int): Boolean {
    val seen = mutableSetOf<Int>()
    var x = n
    while (x != 1 && seen.add(x)) x = squareDigitSum(x)
    return x == 1
}

fun main() = println((1..50).filter(::isHappy))
