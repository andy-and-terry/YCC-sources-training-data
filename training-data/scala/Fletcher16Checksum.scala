object Fletcher16Checksum extends App {
  def fletcher16(data: Array[Byte]): Int = {
    var s1 = 0
    var s2 = 0
    for (b <- data) {
      s1 = (s1 + (b & 0xff)) % 255
      s2 = (s2 + s1) % 255
    }
    (s2 << 8) | s1
  }

  println(Integer.toHexString(fletcher16("abcde".getBytes)))
}
