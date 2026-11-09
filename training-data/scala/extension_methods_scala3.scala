extension (s: String)
  def shout: String = s.toUpperCase + "!"
  def isPalin: Boolean = s == s.reverse

@main def run(): Unit =
  println("hi".shout)
  println("level".isPalin)
