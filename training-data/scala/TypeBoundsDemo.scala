object TypeBoundsDemo {
  trait Animal { def name: String }
  case class Dog(name: String) extends Animal
  case class Cat(name: String) extends Animal

  // upper bound: T must be a subtype of Animal
  def names[T <: Animal](xs: List[T]): List[String] = xs.map(_.name)

  // upper bound with Ordered
  def largest[T <: Ordered[T]](xs: List[T]): T = xs.reduceLeft((a, b) => if (a >= b) a else b)

  // lower bound: result widens to a supertype
  def prepend[B >: Dog](d: Dog, rest: List[B]): List[B] = d :: rest

  case class Version(major: Int, minor: Int) extends Ordered[Version] {
    def compare(that: Version): Int =
      if (major != that.major) major.compare(that.major) else minor.compare(that.minor)
  }

  class Box[+A](val value: A) {
    def getOrElse[B >: A](default: B): B = if (value == null) default else value
  }

  def main(args: Array[String]): Unit = {
    println(names(List(Dog("rex"), Dog("fido"))))
    println(largest(List(Version(1, 2), Version(2, 0), Version(1, 9))))
    val mixed: List[Animal] = prepend(Dog("rex"), List(Cat("tom")))
    println(mixed.map(_.name))
    val box: Box[Animal] = new Box(Dog("rex"))
    println(box.getOrElse(Cat("tom")).name)
    println(new Box[Dog](null).getOrElse(Cat("fallback")))
  }
}
