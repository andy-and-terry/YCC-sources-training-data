// Thue-Morse: t(n) is the parity of the number of 1 bits in n
object ThueMorseSequence extends App {
  println((0 until 32).map(n => Integer.bitCount(n) % 2).mkString)
}
