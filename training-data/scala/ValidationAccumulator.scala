sealed trait Validated[+E, +A]
case class Valid[A](value: A) extends Validated[Nothing, A]
case class Invalid[E](errors: List[E]) extends Validated[E, Nothing]

object Validated {
  def map2[E, A, B, C](va: Validated[E, A], vb: Validated[E, B])(f: (A, B) => C): Validated[E, C] =
    (va, vb) match {
      case (Valid(a), Valid(b)) => Valid(f(a, b))
      case (Invalid(e1), Invalid(e2)) => Invalid(e1 ++ e2)
      case (Invalid(e1), _) => Invalid(e1)
      case (_, Invalid(e2)) => Invalid(e2)
    }
}

case class Person(name: String, age: Int)

object ValidationAccumulator {
  def validateName(name: String): Validated[String, String] =
    if (name.nonEmpty) Valid(name) else Invalid(List("name must not be empty"))

  def validateAge(age: Int): Validated[String, Int] =
    if (age >= 0 && age < 150) Valid(age) else Invalid(List("age is out of range"))

  def validatePerson(name: String, age: Int): Validated[String, Person] =
    Validated.map2(validateName(name), validateAge(age))(Person.apply)

  def main(args: Array[String]): Unit = {
    println(validatePerson("Ada", 30))
    println(validatePerson("", -5))
    println(validatePerson("Bob", 200))
  }
}
