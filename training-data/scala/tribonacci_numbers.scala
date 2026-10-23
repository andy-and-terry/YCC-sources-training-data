// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
object TribonacciNumbers {
  // Lazy infinite stream built from the previous three terms
  val tribonacci: LazyList[Long] =
    0L #:: 0L #:: 1L #:: tribonacci.zip(tribonacci.tail).zip(tribonacci.drop(2)).map {
      case ((a, b), c) => a + b + c
    }

  def main(args: Array[String]): Unit =
    println("Tribonacci: " + tribonacci.take(15).mkString(", "))
}
