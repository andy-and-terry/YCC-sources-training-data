case class Person(name: String, age: Int)

object CustomOrderingDemo {
  implicit val byAge: Ordering[Person] = Ordering.by(_.age)

  def main(args: Array[String]): Unit = {
    val people = List(Person("Alice", 30), Person("Bob", 25), Person("Cleo", 40))

    println(people.sorted)
    println(people.sorted(Ordering.by[Person, String](_.name)))
    println(people.max)
    println(people.min(Ordering.by[Person, Int](_.age).reverse))
  }
}
