import scala.collection.mutable

trait ChatMediator {
  def register(user: User): Unit
  def relay(sender: String, message: String): Unit
}

class ChatRoom extends ChatMediator {
  private val users = mutable.Map[String, User]()

  def register(user: User): Unit = users(user.name) = user

  def relay(sender: String, message: String): Unit =
    users.values.filter(_.name != sender).foreach(_.receive(sender, message))
}

class User(val name: String, mediator: ChatMediator) {
  mediator.register(this)

  def send(message: String): Unit = mediator.relay(name, message)
  def receive(sender: String, message: String): Unit =
    println(s"$name received from $sender: $message")
}

object MediatorPattern {
  def main(args: Array[String]): Unit = {
    val room = new ChatRoom
    val alice = new User("alice", room)
    val bob = new User("bob", room)

    alice.send("hi bob")
    bob.send("hey alice")
  }
}
