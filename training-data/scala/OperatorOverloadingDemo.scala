case class Vector2D(x: Double, y: Double) {
  def +(other: Vector2D): Vector2D = Vector2D(x + other.x, y + other.y)
  def *(scalar: Double): Vector2D = Vector2D(x * scalar, y * scalar)
}

object OperatorOverloadingDemo {
  def main(args: Array[String]): Unit = {
    val v1 = Vector2D(1.0, 2.0)
    val v2 = Vector2D(3.0, 4.0)
    println(v1 + v2)
    println(v1 * 2.0)
  }
}
