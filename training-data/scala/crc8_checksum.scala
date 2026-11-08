object Crc8Checksum extends App {
  def crc8(data: Array[Byte]): Int =
    data.foldLeft(0) { (crc, b) =>
      (0 until 8).foldLeft(crc ^ (b & 0xFF)) { (c, _) =>
        if ((c & 0x80) != 0) ((c << 1) ^ 0x07) & 0xFF else (c << 1) & 0xFF
      }
    }

  println(f"${crc8("123456789".getBytes)}%02x")
}
