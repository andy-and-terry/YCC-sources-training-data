object WhileAndDoLoops {
  def digits(n: Int): List[Int] = {
    var rest = n
    var acc = List.empty[Int]
    while (rest > 0) {
      acc = rest % 10 :: acc
      rest /= 10
    }
    acc
  }

  def main(args: Array[String]): Unit = {
    println(digits(90417))

    var i = 0
    while (i < 5) {
      if (i != 2) print(i + " ")
      i += 1
    }
    println()

    var n = 1
    while (n * n < 200) n += 1
    println(n)

    var tries = 0
    var ok = false
    while (!ok && tries < 10) {
      tries += 1
      ok = tries * tries > 30
    }
    println(s"stopped after $tries")
  }
}
