object GouldSequence extends App {
  def gould(n: Int): Int = 1 << Integer.bitCount(n)

  println((0 until 16).map(gould).mkString(" "))
}
