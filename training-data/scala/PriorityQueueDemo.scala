import scala.collection.mutable

object PriorityQueueDemo {
  def main(args: Array[String]): Unit = {
    val maxHeap = mutable.PriorityQueue[Int](5, 1, 8, 3, 9)
    val sorted = mutable.ArrayBuffer[Int]()
    while (maxHeap.nonEmpty) sorted += maxHeap.dequeue()
    println(sorted.toList)

    val minHeap = mutable.PriorityQueue[Int]()(Ordering[Int].reverse)
    minHeap ++= List(5, 1, 8, 3, 9)
    println(minHeap.dequeue())
    println(minHeap.dequeue())
  }
}
