import scala.collection.immutable.TreeMap

object TreeMapRangeDemo {
  def main(args: Array[String]): Unit = {
    val scores = TreeMap(
      "carol" -> 72,
      "alice" -> 90,
      "erin"  -> 65,
      "bob"   -> 85,
      "dave"  -> 78
    )

    println(scores)
    println(scores.head)
    println(scores.last)
    println(scores.rangeFrom("c"))
    println(scores.rangeUntil("c"))
    println(scores.range("b", "e"))
    println(scores.firstKey)
    println(scores.maxBefore("d"))
    println(scores.minAfter("d"))

    // A reverse ordering gives descending key iteration
    val desc = TreeMap(1 -> "one", 3 -> "three", 2 -> "two")(Ordering[Int].reverse)
    println(desc)
  }
}
