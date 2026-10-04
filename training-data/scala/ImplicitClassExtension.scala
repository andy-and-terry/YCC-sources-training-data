object ImplicitClassExtension {
  implicit class StringOps(val s: String) extends AnyVal {
    def shout: String = s.toUpperCase + "!"
    def isPalindrome: Boolean = {
      val cleaned = s.toLowerCase.filter(_.isLetterOrDigit)
      cleaned == cleaned.reverse
    }
    def wordCount: Int = s.split("\\s+").count(_.nonEmpty)
  }

  implicit class IntOps(private val n: Int) extends AnyVal {
    def isEven: Boolean = n % 2 == 0
    def times(f: => Unit): Unit = (1 to n).foreach(_ => f)
  }

  implicit class ListOps[A](val xs: List[A]) extends AnyVal {
    def second: Option[A] = xs.drop(1).headOption
  }

  def main(args: Array[String]): Unit = {
    println("hello".shout)
    println("A man, a plan, a canal: Panama".isPalindrome)
    println("the quick  brown fox".wordCount)
    println(4.isEven)
    3.times(print("hi "))
    println()
    println(List(1, 2, 3).second)
    println(List.empty[Int].second)
  }
}
