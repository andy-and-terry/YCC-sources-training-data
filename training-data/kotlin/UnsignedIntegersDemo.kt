fun main() {
    val a: UInt = 4_000_000_000u
    val b: UByte = 250u
    val c: ULong = ULong.MAX_VALUE

    println(a)
    println(a + 500_000_000u)
    println(b + 10u)
    println(c)
    println(UInt.MAX_VALUE)

    val signed: Int = a.toInt()
    println(signed)
    println((-1).toUInt())
    println(255.toUByte().toInt())
    println(200u.toUByte() > 100u.toUByte())

    println("ff".toUInt(16))
    println(10u.toString(2))
    println(listOf(3u, 1u, 2u).sorted())
}
