object LensCaseClass {
  case class Lens[S, A](get: S => A, set: (S, A) => S) {
    def modify(s: S)(f: A => A): S = set(s, f(get(s)))
    def andThen[B](o: Lens[A, B]): Lens[S, B] =
      Lens(s => o.get(get(s)), (s, b) => set(s, o.set(get(s), b)))
  }

  case class Street(name: String, number: Int)
  case class Address(street: Street, city: String)
  case class Person(name: String, address: Address)

  val addressL = Lens[Person, Address](_.address, (p, a) => p.copy(address = a))
  val streetL = Lens[Address, Street](_.street, (a, s) => a.copy(street = s))
  val numberL = Lens[Street, Int](_.number, (s, n) => s.copy(number = n))
  val personNumber = addressL.andThen(streetL).andThen(numberL)

  def main(args: Array[String]): Unit = {
    val p = Person("Zoe", Address(Street("Main", 10), "Paris"))
    println(personNumber.get(p))
    println(personNumber.set(p, 42))
    println(personNumber.modify(p)(_ + 1))
  }
}
