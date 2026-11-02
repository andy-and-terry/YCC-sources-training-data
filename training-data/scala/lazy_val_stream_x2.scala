object LazyValStreamX2 extends App {
  lazy val v = { println("computed"); 42 }
  println("before")
  println(v + v)
  val fibs: LazyList[BigInt] = BigInt(0) #:: BigInt(1) #:: fibs.zip(fibs.tail).map { case (a, b) => a + b }
  println(fibs.take(10).toList)
}
