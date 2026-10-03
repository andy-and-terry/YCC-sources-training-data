class ChatMediator {
    private val members = mutableListOf<ChatMember>()

    fun register(member: ChatMember) {
        members.add(member)
        member.mediator = this
    }

    fun broadcast(sender: ChatMember, message: String) {
        members.filter { it != sender }.forEach { it.receive(message) }
    }
}

class ChatMember(private val name: String) {
    lateinit var mediator: ChatMediator

    fun send(message: String) {
        println("$name sends: $message")
        mediator.broadcast(this, message)
    }

    fun receive(message: String) = println("$name received: $message")
}

fun main() {
    val mediator = ChatMediator()
    val alice = ChatMember("Alice")
    val bob = ChatMember("Bob")
    mediator.register(alice)
    mediator.register(bob)
    alice.send("hello everyone")
}
