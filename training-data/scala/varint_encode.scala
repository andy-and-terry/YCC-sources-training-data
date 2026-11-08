object VarintEncode extends App {
  def varint(n: Long): List[Int] =
    if (n < 128) List(n.toInt)
    else (((n & 0x7F) | 0x80).toInt) :: varint(n >> 7)

  println(varint(300).map(b => f"$b%02x").mkString(" "))
}
