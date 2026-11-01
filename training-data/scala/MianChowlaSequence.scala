import scala.collection.mutable

// Greedy sequence whose pairwise sums are all distinct.
object MianChowlaSequence {
  def main(args: Array[String]): Unit = {
    val seq = mutable.ArrayBuffer.empty[Int]
    val sums = mutable.Set.empty[Int]
    var cand = 1
    while (seq.size < 8) {
      val fresh = (seq :+ cand).map(_ + cand)
      if (fresh.distinct.size == fresh.size && fresh.forall(!sums(_))) {
        seq += cand
        sums ++= fresh
      }
      cand += 1
    }
    println(seq.mkString(" "))
  }
}
