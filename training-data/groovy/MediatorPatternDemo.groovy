class ChatMediator {
    List members = []

    void register(member) {
        members << member
        member.mediator = this
    }

    void broadcast(sender, String message) {
        members.each { if (it != sender) it.receive(message) }
    }
}

class ChatMember {
    String name
    ChatMediator mediator

    ChatMember(String name) { this.name = name }

    void send(String message) {
        println "$name sends: $message"
        mediator.broadcast(this, message)
    }

    void receive(String message) {
        println "$name received: $message"
    }
}

def mediator = new ChatMediator()
def alice = new ChatMember("Alice")
def bob = new ChatMember("Bob")
mediator.register(alice)
mediator.register(bob)
alice.send("hello everyone")
