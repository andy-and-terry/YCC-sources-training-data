// Square of the sum minus sum of squares for 1..10 (expect 2640)
object SumSquareDifference extends App {
  val xs = 1 to 10
  val sum = xs.sum
  val squares = xs.map(x => x * x).sum
  println(sum * sum - squares)
}
