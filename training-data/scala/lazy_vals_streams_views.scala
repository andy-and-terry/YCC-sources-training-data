object LazyValsStreamsViews {
  lazy val expensive: Int = { println("computing"); 42 }

  def main(args: Array[String]): Unit = {
    println("start")
    println(expensive + expensive)
    val fibs: LazyList[BigInt] = BigInt(0) #:: BigInt(1) #:: fibs.zip(fibs.tail).map { case (a, b) => a + b }
    println(fibs.take(12).toList)
    println(fibs(90))
    val v = (1 to 1000000).view.map(_ * 2).filter(_ % 3 == 0)
    println(v.take(3).toList)
    println(LazyList.from(1).filter(n => n % 7 == 0).take(3).toList)
    println(Iterator.iterate(1)(_ * 2).takeWhile(_ < 100).toList)
  }
}
