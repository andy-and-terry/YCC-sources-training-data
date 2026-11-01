import java.math.BigInteger

// Reverse-and-add until a palindrome; count the steps.
fun reverse(n: BigInteger): BigInteger = BigInteger(n.toString().reversed())

fun steps(start: Int): Int {
    var n = BigInteger.valueOf(start.toLong())
    for (count in 0 until 100) {
        if (count > 0 && n == reverse(n)) return count
        n += reverse(n)
    }
    return -1
}

fun main() {
    println(listOf(56, 57, 59, 79, 89).joinToString(" ") { steps(it).toString() })
}
