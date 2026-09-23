class ChatRoom {
  def showMessage(user: User, message: String): Unit =
    println(s"[chat] ${user.name}: $message")
}

class User(val name: String, room: ChatRoom) {
  def send(message: String): Unit = room.showMessage(this, message)
}

object MediatorPatternDemo {
  def main(args: Array[String]): Unit = {
    val room = new ChatRoom
    val alice = new User("Alice", room)
    val bob = new User("Bob", room)

    alice.send("hey bob!")
    bob.send("hey alice, how are you?")
  }
}
