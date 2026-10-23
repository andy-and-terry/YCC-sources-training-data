object TupleSwapDemo extends App {
  // Tuples hold fixed-size mixed values; access with _1, _2 or destructure.
  val pair = ("answer", 42)
  println(pair._1 + " " + pair._2)
  val (label, value) = pair
  println(s"$label=$value")

  // swap is built in for Tuple2
  println(pair.swap)

  // Multiple assignment via pattern
  val (a, b, c) = (1, 2.5, "three")
  println(s"$a $b $c")

  // Swapping two variables
  var x = 1
  var y = 2
  val tmp = (y, x)
  x = tmp._1
  y = tmp._2
  println(s"x=$x y=$y")

  // Tuples in collections
  val scores = List(("ann", 90), ("bob", 72), ("cy", 85))
  println(scores.sortBy(_._2))
  println(scores.map { case (n, s) => s"$n:$s" })
  println(scores.unzip)
  println(scores.toMap)

  // zip and partition return tuples
  val (pass, fail) = scores.partition(_._2 >= 80)
  println(pass)
  println(fail)

  // Function returning multiple values
  def minMax(xs: Seq[Int]): (Int, Int) = (xs.min, xs.max)
  val (lo, hi) = minMax(Seq(4, 9, 1, 7))
  println(s"$lo $hi")
}
