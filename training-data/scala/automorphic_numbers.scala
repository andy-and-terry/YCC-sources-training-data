object AutomorphicNumbers extends App {
  def isAutomorphic(n: Long): Boolean = (n * n).toString.endsWith(n.toString)

  println((0L until 1000L).filter(isAutomorphic).toList) // List(0, 1, 5, 6, 25, 76, 376, 625)
}
