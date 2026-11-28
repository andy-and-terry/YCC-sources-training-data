object PlusOneDigits {
  def plusOne(digits: List[Int]): List[Int] = {
    val (carry, result) = digits.foldRight((1, List.empty[Int])) { case (d, (c, acc)) =>
      val s = d + c
      (s / 10, s % 10 :: acc)
    }
    if (carry > 0) carry :: result else result
  }

  def main(args: Array[String]): Unit = {
    println(plusOne(List(1, 2, 9))) // List(1, 3, 0)
    println(plusOne(List(9, 9)))    // List(1, 0, 0)
  }
}
