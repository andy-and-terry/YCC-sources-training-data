object MatrixMultiply {
  type Matrix = Vector[Vector[Int]]

  def transpose(m: Matrix): Matrix = m.transpose

  def multiply(a: Matrix, b: Matrix): Matrix = {
    val bt = transpose(b)
    a.map(row => bt.map(col => row.zip(col).map { case (x, y) => x * y }.sum))
  }

  def main(args: Array[String]): Unit = {
    val a = Vector(Vector(1, 2), Vector(3, 4))
    val b = Vector(Vector(5, 6), Vector(7, 8))
    multiply(a, b).foreach(r => println(r.mkString(" ")))
  }
}
