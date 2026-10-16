object CaseClassCopyUpdate {
  case class Address(city: String, zip: String)
  case class Person(name: String, age: Int, address: Address)

  def main(args: Array[String]): Unit = {
    val p = Person("Ann", 30, Address("Oslo", "0150"))
    val older = p.copy(age = p.age + 1)
    val moved = p.copy(address = p.address.copy(city = "Bergen"))
    println(older)
    println(moved)
    println(p == older.copy(age = 30))
    println(p.hashCode == older.copy(age = 30).hashCode)
    println(p.productArity + " " + p.productElement(0))
    println(p.productIterator.toList)
    val (name, age, _) = Person.unapply(p).get
    println(s"$name $age")
  }
}
