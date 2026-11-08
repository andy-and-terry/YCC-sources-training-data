fun crc8(data: ByteArray): Int {
    var crc = 0
    for (b in data) {
        crc = crc xor (b.toInt() and 0xFF)
        repeat(8) {
            crc = if (crc and 0x80 != 0) ((crc shl 1) xor 0x07) and 0xFF else (crc shl 1) and 0xFF
        }
    }
    return crc
}

fun main() = println("%02x".format(crc8("123456789".toByteArray())))
