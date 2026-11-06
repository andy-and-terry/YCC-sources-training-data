// Integer (1..3999) to Roman numeral using a greedy table.
val table = List(
  1000 -> "M", 900 -> "CM", 500 -> "D", 400 -> "CD", 100 -> "C", 90 -> "XC",
  50 -> "L", 40 -> "XL", 10 -> "X", 9 -> "IX", 5 -> "V", 4 -> "IV", 1 -> "I"
)

def toRoman(n: Int): String =
  table.foldLeft((n, "")) { case ((rest, out), (value, symbol)) =>
    (rest % value, out + symbol * (rest / value))
  }._2

@main def intToRoman(): Unit =
  println(s"${toRoman(1994)} ${toRoman(58)}")
