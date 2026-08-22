object MergeSort {
  def mergeSort(list: List[Int]): List[Int] = {
    if (list.length <= 1) list
    else {
      val (left, right) = list.splitAt(list.length / 2)
      merge(mergeSort(left), mergeSort(right))
    }
  }

  def merge(left: List[Int], right: List[Int]): List[Int] = (left, right) match {
    case (Nil, r) => r
    case (l, Nil) => l
    case (l :: ls, r :: rs) =>
      if (l <= r) l :: merge(ls, right)
      else r :: merge(left, rs)
  }

  def main(args: Array[String]): Unit = {
    println(mergeSort(List(5, 2, 9, 1, 5, 6)))
  }
}
