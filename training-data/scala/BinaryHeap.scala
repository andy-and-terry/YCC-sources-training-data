import scala.collection.mutable

object BinaryHeap {
  def main(args: Array[String]): Unit = {
    val pq = mutable.PriorityQueue[Int]()(Ordering[Int].reverse)
    List(5, 3, 8, 1, 9, 2).foreach(pq.enqueue(_))
    val sorted = mutable.ListBuffer[Int]()
    while (pq.nonEmpty) sorted += pq.dequeue()
    println(sorted.toList)
  }
}
