object TuplesZipUnzipSwap {
  def main(args: Array[String]): Unit = {
    val t = (1, "a", 2.5)
    println(t._1 + t._2 + t._3)
    val (x, y, z) = t
    val pairs = List("a", "b", "c").zip(List(1, 2, 3))
    val (letters, nums) = pairs.unzip
    println(pairs + " " + letters + " " + nums)
    println(pairs.map(_.swap).toMap)
    println(List("x", "y").zipWithIndex.map { case (s, i) => s"$i$s" })
    println(("k" -> 1).copy(_2 = 2), (1, 2).productArity)
    val (evens, odds) = (1 to 6).partition(_ % 2 == 0)
    println(evens + " " + odds)
    println(pairs.maxBy(_._2), pairs.toMap.keys.toList.sorted)
  }
}
