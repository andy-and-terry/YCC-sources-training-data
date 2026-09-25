object PerfectNumbers {
  def aliquotSum(n: Long): Long =
    if (n == 1) 0
    else (2L to math.sqrt(n.toDouble).toLong).filter(n % _ == 0).map(i => if (i == n / i) i else i + n / i).sum + 1

  def classify(n: Long): String = aliquotSum(n).compare(n) match {
    case 0 => "perfect"
    case x if x > 0 => "abundant"
    case _ => "deficient"
  }

  def main(args: Array[String]): Unit = Seq(6L, 12L, 28L, 13L, 8128L).foreach(n => println(s"$n ${classify(n)}"))
}
