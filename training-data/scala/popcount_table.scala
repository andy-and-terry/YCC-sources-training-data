// Population count (number of set bits) for 0..15
object PopcountTable extends App {
  println((0 until 16).map(n => Integer.bitCount(n)).mkString(" "))
}
