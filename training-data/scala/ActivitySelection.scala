object ActivitySelection {
  def selectActivities(activities: List[(Int, Int)]): List[(Int, Int)] = {
    val ordered = activities.sortBy(_._2)
    var lastEnd = Int.MinValue
    val selected = scala.collection.mutable.ListBuffer[(Int, Int)]()

    for ((start, end) <- ordered) {
      if (start >= lastEnd) {
        selected += ((start, end))
        lastEnd = end
      }
    }
    selected.toList
  }

  def main(args: Array[String]): Unit = {
    val activities = List((1, 4), (3, 5), (0, 6), (5, 7), (3, 9), (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16))
    println(selectActivities(activities))
  }
}
