interface ChatMediator {
  broadcast(sender: string, message: string): void;
  register(user: ChatUser): void;
}

class ChatRoom implements ChatMediator {
  private users: ChatUser[] = [];

  register(user: ChatUser): void {
    this.users.push(user);
  }

  broadcast(sender: string, message: string): void {
    for (const user of this.users) {
      if (user.name !== sender) {
        user.receive(sender, message);
      }
    }
  }
}

class ChatUser {
  constructor(
    public name: string,
    private mediator: ChatMediator,
  ) {
    mediator.register(this);
  }

  send(message: string): void {
    console.log(`${this.name} sends: ${message}`);
    this.mediator.broadcast(this.name, message);
  }

  receive(sender: string, message: string): void {
    console.log(`${this.name} received from ${sender}: ${message}`);
  }
}

const room = new ChatRoom();
const alice = new ChatUser('Alice', room);
const bob = new ChatUser('Bob', room);

alice.send('hello everyone');
bob.send('hi Alice');
