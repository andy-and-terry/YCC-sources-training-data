object GenericsVarianceBounds {
  class Box[+A](val value: A) { def map[B](f: A => B): Box[B] = new Box(f(value)) }
  trait Sink[-A] { def put(a: A): Unit }
  class Animal; class Dog extends Animal

  def oldest[T <: Comparable[T]](xs: List[T]): T = xs.reduce((a, b) => if (a.compareTo(b) >= 0) a else b)
  def firstOr[A, B >: A](xs: List[A], d: B): B = xs.headOption.getOrElse(d)

  def main(args: Array[String]): Unit = {
    val b: Box[Animal] = new Box[Dog](new Dog)
    val sink: Sink[Dog] = new Sink[Animal] { def put(a: Animal) = println("accepted animal") }
    sink.put(new Dog)
    println(oldest(List("pear", "apple", "zebra")))
    println(firstOr(List.empty[Int], "none"))
    println(new Box(3).map(_ * 2).value)
  }
}
