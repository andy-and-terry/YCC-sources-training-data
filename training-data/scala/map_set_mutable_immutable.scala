import scala.collection.mutable

object MapSetMutableImmutable {
  def main(args: Array[String]): Unit = {
    val m = Map("a" -> 1, "b" -> 2)
    val m2 = m + ("c" -> 3) - "a"
    println(m2 + " " + m.getOrElse("z", 0) + " " + m.get("a"))
    println(m.map { case (k, v) => k.toUpperCase -> v * 10 })
    val counts = mutable.Map.empty[Char, Int].withDefaultValue(0)
    for (c <- "banana") counts(c) += 1
    println(counts.toSeq.sortBy(-_._2))
    val s = Set(1, 2, 3) & Set(2, 3, 4)
    println(s + " " + (Set(1) ++ Set(2)) + " " + s.subsetOf(Set(2, 3, 9)))
    val buf = mutable.ArrayBuffer(1, 2)
    buf += 3; buf.prepend(0); buf.remove(1)
    println(buf)
    val sb = new StringBuilder("ab"); sb.append('c').append(1)
    println(sb)
    println(mutable.Queue(1, 2).dequeue() + mutable.Stack(1, 2).pop())
  }
}
