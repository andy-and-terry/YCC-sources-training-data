object StringBuilderDemo {
  def main(args: Array[String]): Unit = {
    val sb = new StringBuilder
    sb.append("Scala")
    sb.append(' ').append(3).append(" is ").append(true)
    println(sb.toString)

    sb.insert(0, ">> ")
    sb.setCharAt(3, 's')
    println(sb)
    println(sb.length)
    println(sb.reverse)

    val numbers = (1 to 5).foldLeft(new StringBuilder) { (b, n) =>
      if (b.nonEmpty) b.append(",")
      b.append(n * n)
    }
    println(numbers.result())
  }
}
