// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
object PadovanSequence {
  val padovan: LazyList[Long] = 1L #:: 1L #:: 1L #:: padovan.zip(padovan.tail).map { case (a, b) => a + b }

  def main(args: Array[String]): Unit =
    println(padovan.take(15).mkString(" "))
}
