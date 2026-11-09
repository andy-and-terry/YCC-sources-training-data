object CollectionsFoldGroup extends App {
  val ws = List("apple", "avocado", "banana", "cherry")
  println(ws.groupBy(_.head).view.mapValues(_.size).toMap)
  println(ws.foldLeft(0)(_ + _.length))
  println(ws.zipWithIndex.map { case (w, i) => s"$i:$w" })
}
