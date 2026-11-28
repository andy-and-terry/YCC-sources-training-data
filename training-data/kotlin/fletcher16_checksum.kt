fun fletcher16(data: ByteArray): Int {
    var s1 = 0
    var s2 = 0
    for (b in data) {
        s1 = (s1 + (b.toInt() and 0xff)) % 255
        s2 = (s2 + s1) % 255
    }
    return (s2 shl 8) or s1
}

fun main() {
    println(fletcher16("abcde".toByteArray()).toString(16))
}
