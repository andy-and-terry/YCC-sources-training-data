object VectorOperations {
  def main(args: Array[String]): Unit = {
    val v = Vector(1, 2, 3, 4, 5)
    val v2 = v :+ 6
    val v3 = 0 +: v2
    println(v3)
    println(v3.updated(2, 99))
    println(v3(3))
    println(v3.take(3) ++ v3.takeRight(2))
    println(v.splitAt(2))
    println(v.indexWhere(_ > 3))
    println(v.reverse.zipWithIndex)
    println(v.patch(1, Vector(7, 7), 2))
    println(Vector.fill(3)("x") ++ Vector.tabulate(3)(i => i * i).map(_.toString))
  }
}
