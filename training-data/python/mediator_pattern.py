from abc import ABC, abstractmethod
from typing import List


class ChatRoom(ABC):
    @abstractmethod
    def broadcast(self, sender: "User", message: str) -> None:
        ...

    @abstractmethod
    def register(self, user: "User") -> None:
        ...


class User:
    """Colleagues never talk to each other directly -- every message is
    routed through the mediator, so adding a new user never requires
    changing existing ones."""

    def __init__(self, name: str, room: ChatRoom):
        self.name = name
        self.room = room
        room.register(self)

    def send(self, message: str) -> None:
        print(f"{self.name} sends: {message}")
        self.room.broadcast(self, message)

    def receive(self, sender: "User", message: str) -> None:
        print(f"  {self.name} received from {sender.name}: {message}")


class ConcreteChatRoom(ChatRoom):
    def __init__(self):
        self.users: List[User] = []

    def register(self, user: User) -> None:
        self.users.append(user)

    def broadcast(self, sender: User, message: str) -> None:
        for user in self.users:
            if user is not sender:
                user.receive(sender, message)


if __name__ == "__main__":
    room = ConcreteChatRoom()
    alice = User("Alice", room)
    bob = User("Bob", room)
    carol = User("Carol", room)

    alice.send("hello everyone")
    bob.send("hey Alice")
