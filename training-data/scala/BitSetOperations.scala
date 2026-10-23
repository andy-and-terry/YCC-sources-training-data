import scala.collection.immutable.BitSet

object BitSetOperations {
  def main(args: Array[String]): Unit = {
    val a = BitSet(1, 3, 5, 7, 9)
    val b = BitSet(3, 4, 5, 6)

    println(a & b)
    println(a | b)
    println(a &~ b)
    println(a ^ b)
    println(a.contains(7))
    println(a + 2)
    println(a - 1)
    println(a.size)
    println(a.toBitMask.toList)

    val evens = BitSet.fromSpecific((0 to 10).filter(_ % 2 == 0))
    println(evens)
    println(evens.subsetOf(BitSet(0 to 10: _*)))
  }
}
