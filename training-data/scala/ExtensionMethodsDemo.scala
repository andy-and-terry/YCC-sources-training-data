// Scala 3 extension methods add behaviour to existing types without wrappers.
extension (s: String)
  def isPalindrome: Boolean =
    val cleaned = s.filter(_.isLetterOrDigit).toLowerCase
    cleaned == cleaned.reverse
  def shout: String = s.toUpperCase + "!"

extension [T](xs: List[T])
  def second: Option[T] = xs.drop(1).headOption

extension (n: Int)
  def squared: Int = n * n
  infix def divides(m: Int): Boolean = m % n == 0

@main def extensionMethodsDemo(): Unit =
  println("A man, a plan, a canal: Panama".isPalindrome)
  println("hello".shout)
  println(List(1, 2, 3).second)
  println(List.empty[Int].second)
  println(7.squared)
  println(3 divides 12)
