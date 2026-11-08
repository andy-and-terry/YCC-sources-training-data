int crc8(byte[] data) {
    int crc = 0
    data.each { b ->
        crc ^= (b & 0xFF)
        8.times {
            crc = (crc & 0x80) ? (((crc << 1) ^ 0x07) & 0xFF) : ((crc << 1) & 0xFF)
        }
    }
    crc
}

println Integer.toHexString(crc8('123456789'.bytes))
