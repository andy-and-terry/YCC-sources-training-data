fun isPowerOfTwo(n: Int) = n > 0 && (n and (n - 1)) == 0

fun main() {
    println(isPowerOfTwo(64))
    println(isPowerOfTwo(65))
    println(Integer.bitCount(0b10110111))
    println(42.countOneBits())
    println(40.countTrailingZeroBits())
    println(1.shl(10))
    println((-16).shr(2))
    println((-16).ushr(28))
    println(0b1100 xor 0b1010)
    println(5.inv())
    println(Integer.toBinaryString(42))

    var a = 5
    var b = 9
    a = a xor b
    b = a xor b
    a = a xor b
    println("$a $b")
}
