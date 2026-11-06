// Bulls and Cows scoring for equal-length digit strings.
def score(secret: String, guess: String): (Int, Int) =
  val pairs = secret.zip(guess)
  val bulls = pairs.count((s, g) => s == g)
  val rest = pairs.filter((s, g) => s != g)
  val sc = rest.map(_._1).groupBy(identity).view.mapValues(_.length).toMap
  val gc = rest.map(_._2).groupBy(identity).view.mapValues(_.length).toMap
  val cows = sc.map((c, n) => math.min(n, gc.getOrElse(c, 0))).sum
  (bulls, cows)

@main def bullsAndCows(): Unit =
  val (b, c) = score("1807", "7810")
  println(s"$b bull(s), $c cow(s)")
