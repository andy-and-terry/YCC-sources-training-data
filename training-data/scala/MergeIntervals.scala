object MergeIntervals {
  def merge(intervals: List[(Int, Int)]): List[(Int, Int)] = {
    val sorted = intervals.sortBy(_._1)
    sorted.foldLeft(List.empty[(Int, Int)]) { (acc, interval) =>
      acc match {
        case (start, end) :: rest if interval._1 <= end =>
          (start, math.max(end, interval._2)) :: rest
        case _ => interval :: acc
      }
    }.reverse
  }

  def main(args: Array[String]): Unit = {
    println(merge(List((1, 3), (2, 6), (8, 10), (15, 18))))
    println(merge(List((1, 4), (4, 5))))
  }
}
