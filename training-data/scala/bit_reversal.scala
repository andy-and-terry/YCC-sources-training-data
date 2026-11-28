object BitReversal extends App {
  def reverseBits(value: Int, width: Int = 8): Int =
    (0 until width).foldLeft(0)((acc, i) => (acc << 1) | ((value >> i) & 1))

  List(1, 6, 13, 128).foreach(v => println(s"$v ${reverseBits(v)}")) // 128 96 176 1
}
