import scala.collection.mutable

class MovingAverage(size: Int) {
  private val window = mutable.Queue.empty[Double]
  private var sum = 0.0

  def next(v: Double): Double = {
    window.enqueue(v)
    sum += v
    if (window.size > size) sum -= window.dequeue()
    sum / window.size
  }
}

object MovingAverage {
  def main(args: Array[String]): Unit = {
    val ma = new MovingAverage(3)
    println(Seq(1.0, 10, 3, 5, 8, 2).map(v => f"${ma.next(v)}%.2f").mkString(" "))
  }
}
