object SortingDemo {
  case class Person(name: String, age: Int)

  def main(args: Array[String]): Unit = {
    val people = List(Person("Ann", 31), Person("Bob", 25), Person("Cy", 31), Person("Di", 19))

    println(people.sortBy(_.age).map(_.name))
    println(people.sortBy(p => (-p.age, p.name)).map(_.name))
    println(people.sortWith((a, b) => a.name.length > b.name.length || a.name < b.name).map(_.name))
    println(people.sorted(Ordering.by[Person, Int](_.age).reverse).map(_.name))

    println(List(3, 1, 2).sorted)
    println(List(3, 1, 2).sorted(Ordering[Int].reverse))
    println(List("b", "A", "c").sortBy(_.toLowerCase))
    println((List(5, 2, 8).max, List(5, 2, 8).minBy(x => -x)))
    println(List((2, "b"), (1, "z"), (2, "a")).sorted)
    println(List(1, 2, 3, 4).sortBy(x => x % 2))
  }
}
