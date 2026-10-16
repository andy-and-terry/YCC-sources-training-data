object FoldRightLazyShort {
  def main(args: Array[String]): Unit = {
    val xs = List(1, 2, 3, 4)
    println(xs.foldRight(List.empty[Int])((x, acc) => x * 10 :: acc))
    println(xs.foldLeft(List.empty[Int])((acc, x) => x :: acc))
    println(xs.reduce(_ - _))
    println(xs.reduceRight(_ - _))
    println(xs.reduceOption(_ max _))
    println(List.empty[Int].reduceOption(_ + _))
    println(xs.foldLeft("")((s, x) => s + x))
    println(xs.foldLeft("0")((s, x) => s"($s+$x)"))
    println(xs.scanRight(0)(_ + _))
    println(xs.sum.toDouble / xs.size)
  }
}
