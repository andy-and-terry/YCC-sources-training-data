object CollectionPipelineDemo {
  def main(args: Array[String]): Unit = {
    val words = List("apple", "banana", "avocado", "blueberry", "cherry", "apricot")

    val byInitial = words.groupBy(_.head)
    println(byInitial)

    val indexed = words.zipWithIndex.map { case (w, i) => s"$i:$w" }
    println(indexed)

    val lengthsByInitial = byInitial.view.mapValues(_.map(_.length).sum).toMap
    println(lengthsByInitial)
  }
}
