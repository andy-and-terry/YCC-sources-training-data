object ImmutabilityCaseCopyLens {
  case class Address(city: String, zip: String)
  case class Person(name: String, addr: Address, tags: List[String] = Nil)

  def main(args: Array[String]): Unit = {
    val p = Person("Ada", Address("London", "N1"))
    val moved = p.copy(addr = p.addr.copy(city = "Paris"))
    val tagged = moved.copy(tags = "math" :: moved.tags)
    println(p)
    println(tagged)
    println(p == p.copy() && (p eq p.copy()) == false)
    println(p.hashCode == p.copy().hashCode)
    val updated = List(1, 2, 3).updated(1, 99)
    println(updated + " " + Vector(1, 2).appended(3) + " " + (0 +: List(1)))
  }
}
