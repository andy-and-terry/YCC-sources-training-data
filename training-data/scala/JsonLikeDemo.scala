case class User(name: String, age: Int, tags: List[String])

object JsonLikeDemo {
  def toJsonString(user: User): String = {
    s"""{"name": "${user.name}", "age": ${user.age}, "tags": [${user.tags.map(t => s""""$t"""").mkString(", ")}]}"""
  }

  def main(args: Array[String]): Unit = {
    val user = User("Ada", 30, List("math", "engineering"))
    println(toJsonString(user))
  }
}
