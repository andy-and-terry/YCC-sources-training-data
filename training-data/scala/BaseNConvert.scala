object BaseNConvert extends App {
  for (b <- List(2, 8, 16, 36)) println(s"255 in base $b = ${Integer.toString(255, b)}")
  println(Integer.parseInt("zz", 36))
  println(scala.util.Try(Integer.parseInt("9", 8)).isFailure)
}
