trait Logger {
  def log(msg: String): Unit = println(s"[LOG] $msg")
}

trait UserRepository {
  self: Logger =>
  def findUser(id: Int): String = {
    log(s"looking up user $id")
    s"User$id"
  }
}

trait UserService {
  self: UserRepository with Logger =>
  def greet(id: Int): String = {
    val user = findUser(id)
    log(s"greeting $user")
    s"Hello, $user!"
  }
}

class App extends UserService with UserRepository with Logger

object CakePatternSelfType {
  def main(args: Array[String]): Unit = {
    val app = new App
    println(app.greet(42))
  }
}
