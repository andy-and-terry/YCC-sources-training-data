// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
object EulerZigzagNumbers {
  def main(args: Array[String]): Unit = {
    var row = List(1L)
    var out = List(1L)
    for (_ <- 0 until 9) {
      row = row.reverse.scanLeft(0L)(_ + _)
      out = out :+ row.last
    }
    println(out.mkString(" "))
  }
}
