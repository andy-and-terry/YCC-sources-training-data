class ChatRoom {
  constructor() {
    this.users = new Map();
  }
  register(user) {
    this.users.set(user.name, user);
    user.room = this;
  }
  send(message, from, to) {
    if (to) {
      this.users.get(to).receive(message, from);
    } else {
      for (const [name, user] of this.users) {
        if (name !== from) user.receive(message, from);
      }
    }
  }
}

class User {
  constructor(name) {
    this.name = name;
    this.room = null;
    this.inbox = [];
  }
  send(message, to) {
    this.room.send(message, this.name, to);
  }
  receive(message, from) {
    this.inbox.push(`${from}: ${message}`);
  }
}

const room = new ChatRoom();
const alice = new User('Alice');
const bob = new User('Bob');
const carol = new User('Carol');
room.register(alice);
room.register(bob);
room.register(carol);

alice.send('hi everyone', null);
bob.send('hey Alice', 'Alice');

console.log(bob.inbox);
console.log(carol.inbox);
console.log(alice.inbox);
module.exports = { ChatRoom, User };
