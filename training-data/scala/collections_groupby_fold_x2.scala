object CollectionsGroupByFoldX2 extends App {
  val words = List("apple", "avocado", "banana", "blueberry", "cherry")
  println(words.groupBy(_.head).view.mapValues(_.size).toMap)
  println(words.foldLeft(0)(_ + _.length))
}
