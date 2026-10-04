object VarianceDemo {
  class Animal(val name: String)
  class Dog(name: String) extends Animal(name)

  class Box[+A](val value: A)
  trait Printer[-A] { def print(a: A): String }
  class Cell[A](var value: A)

  def main(args: Array[String]): Unit = {
    val dogBox: Box[Dog] = new Box(new Dog("Rex"))
    val animalBox: Box[Animal] = dogBox
    println(animalBox.value.name)

    val animalPrinter = new Printer[Animal] { def print(a: Animal) = "animal:" + a.name }
    val dogPrinter: Printer[Dog] = animalPrinter
    println(dogPrinter.print(new Dog("Fido")))

    val cell = new Cell[Animal](new Dog("Spot"))
    cell.value = new Animal("Generic")
    println(cell.value.name)

    val dogs: List[Dog] = List(new Dog("A"), new Dog("B"))
    val animals: List[Animal] = dogs
    println(animals.map(_.name))
  }
}
