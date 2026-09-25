object RotationCheck {
  def isRotation(a: String, b: String): Boolean = a.length == b.length && (a + a).contains(b)

  def main(args: Array[String]): Unit = {
    println(isRotation("waterbottle", "erbottlewat"))
    println(isRotation("abc", "acb"))
  }
}
