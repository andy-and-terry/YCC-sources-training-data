fun isPowerOfTwo(n: Int) = n > 0 && (n and (n - 1)) == 0

fun countBits(n: Int): Int {
    var x = n
    var c = 0
    while (x != 0) {
        x = x and (x - 1)
        c++
    }
    return c
}

fun main() {
    println(isPowerOfTwo(64))
    println(countBits(0b101101))
    println(Integer.toBinaryString(6 xor 3))
    println(1 shl 10)
    println(-16 shr 2)
    println(-16 ushr 28)
    println(0b1100 or 0b0011)
    println(5.inv())
    println(0xFF.countOneBits())
    println(40.countTrailingZeroBits())
}
