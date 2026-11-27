fun gould(n: Int) = 1 shl Integer.bitCount(n)

fun main() = println((0 until 16).map(::gould))
