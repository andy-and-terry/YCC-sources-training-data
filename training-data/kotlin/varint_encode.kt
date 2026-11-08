fun varint(value: Long): List<Int> {
    var n = value
    val out = mutableListOf<Int>()
    while (n >= 0x80) {
        out += ((n and 0x7F) or 0x80).toInt()
        n = n shr 7
    }
    out += n.toInt()
    return out
}

fun main() = println(varint(300).joinToString(" ") { "%02x".format(it) })
