object StringInterpolationDemo {
  def main(args: Array[String]): Unit = {
    val name = "Ada"
    val score = 93.456
    println(s"Hello, $name! Next year: ${2024 + 1}")
    println(f"Score: $score%.2f, padded: $score%10.1f|")
    println(raw"No escape: \n stays literal for $name")
    println(s"""Multi-line
               |  with margin for $name""".stripMargin)
  }
}
