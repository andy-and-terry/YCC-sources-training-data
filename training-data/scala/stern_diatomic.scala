object SternDiatomic extends App {
  def stern(count: Int): Vector[Int] =
    (2 until count).foldLeft(Vector(0, 1)) { (seq, i) =>
      seq :+ (if (i % 2 == 0) seq(i / 2) else seq(i / 2) + seq(i / 2 + 1))
    }.take(count)

  println(stern(15)) // Vector(0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3)
}
