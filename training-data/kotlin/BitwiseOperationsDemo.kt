fun isPowerOfTwo(n: Int) = n > 0 && (n and (n - 1)) == 0

fun main() {
    val x = 0b101100
    println(x.countOneBits())
    println(x.countTrailingZeroBits())
    println(x and -x)
    println((x shl 2).toString(2))
    println((-16) shr 2)
    println((-16) ushr 28)
    println(5 or 2)
    println(5 xor 3)
    println(5.inv())
    println(isPowerOfTwo(64) to isPowerOfTwo(65))
    println(255.toString(16) + " " + "ff".toInt(16))
    println(Int.MAX_VALUE + 1)
    println(1L shl 40)
    println(x.takeHighestOneBit())
}
