protocol ChatMediator: AnyObject {
    func send(_ message: String, from sender: ChatUser)
}

final class ChatRoom: ChatMediator {
    private var users: [ChatUser] = []

    func register(_ user: ChatUser) {
        users.append(user)
    }

    func send(_ message: String, from sender: ChatUser) {
        for user in users where user !== sender {
            user.receive(message, from: sender.name)
        }
    }
}

final class ChatUser {
    let name: String
    private weak var mediator: ChatMediator?

    init(name: String, mediator: ChatMediator) {
        self.name = name
        self.mediator = mediator
    }

    func send(_ message: String) {
        print("\(name) sends: \(message)")
        mediator?.send(message, from: self)
    }

    func receive(_ message: String, from sender: String) {
        print("\(name) received from \(sender): \(message)")
    }
}

let room = ChatRoom()
let alice = ChatUser(name: "Alice", mediator: room)
let bob = ChatUser(name: "Bob", mediator: room)
room.register(alice)
room.register(bob)

alice.send("hello everyone")
bob.send("hi Alice")
