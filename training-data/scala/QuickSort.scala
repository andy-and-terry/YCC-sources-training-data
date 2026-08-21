object QuickSort {
  def quicksort(items: List[Int]): List[Int] = items match {
    case Nil => Nil
    case pivot :: rest =>
      val (left, right) = rest.partition(_ < pivot)
      quicksort(left) ::: pivot :: quicksort(right)
  }

  def main(args: Array[String]): Unit = {
    println(quicksort(List(5, 3, 8, 1, 9, 2)))
  }
}
