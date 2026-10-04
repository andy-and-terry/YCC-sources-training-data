object VarianceDemo {
  class Animal(val name: String)
  class Dog(name: String) extends Animal(name)

  // Covariant: a producer of A can be treated as a producer of a supertype.
  class Box[+A](val value: A)

  // Contravariant: a consumer of A can consume subtypes.
  trait Printer[-A] {
    def print(a: A): String
  }

  // Invariant: mutable cells must not vary.
  class Cell[A](var value: A)

  def describeBox(b: Box[Animal]): String = b.value.name

  def main(args: Array[String]): Unit = {
    val dogBox: Box[Dog] = new Box(new Dog("Rex"))
    println(describeBox(dogBox))

    val animalPrinter: Printer[Animal] = new Printer[Animal] {
      def print(a: Animal): String = s"animal:${a.name}"
    }
    val dogPrinter: Printer[Dog] = animalPrinter
    println(dogPrinter.print(new Dog("Fido")))

    val animals: List[Animal] = List(new Dog("a"), new Animal("b"))
    println(animals.map(_.name))

    val cell = new Cell[Animal](new Animal("x"))
    cell.value = new Dog("y")
    println(cell.value.name)

    def firstOr[A, B >: A](xs: List[A], default: B): B = xs.headOption.getOrElse(default)
    println(firstOr(List(1, 2), "none"))
    println(firstOr(List.empty[Int], "none"))
  }
}
