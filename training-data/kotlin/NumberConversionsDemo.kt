fun main() {
    println("42".toInt())
    println("3.5".toDouble())
    println("abc".toIntOrNull())
    println("9999999999".toIntOrNull())
    println("9999999999".toLong())
    println("ff".toInt(16))
    println(255.toString(2))

    val big = 300
    println(big.toByte())
    println(3.99.toInt())
    println(-3.99.toInt())
    println(Math.round(2.5))
    println(7 / 2)
    println(7 / 2.0)
    println(7 % 3)
    println((-7).mod(3))
    println(-7 % 3)
    println(Int.MAX_VALUE + 1)
}
