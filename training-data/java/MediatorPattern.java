import java.util.ArrayList;
import java.util.List;

public class MediatorPattern {
    interface ChatMediator {
        void broadcast(String sender, String message);

        void register(User user);
    }

    static class User {
        final String name;
        private ChatMediator mediator;

        User(String name) {
            this.name = name;
        }

        void join(ChatMediator mediator) {
            this.mediator = mediator;
            mediator.register(this);
        }

        void send(String message) {
            System.out.println(name + " sends: " + message);
            mediator.broadcast(name, message);
        }

        void receive(String sender, String message) {
            if (!sender.equals(name)) {
                System.out.println(name + " received from " + sender + ": " + message);
            }
        }
    }

    static class ChatRoom implements ChatMediator {
        private final List<User> users = new ArrayList<>();

        @Override
        public void register(User user) {
            users.add(user);
        }

        @Override
        public void broadcast(String sender, String message) {
            for (User user : users) {
                user.receive(sender, message);
            }
        }
    }

    public static void main(String[] args) {
        ChatRoom room = new ChatRoom();

        User alice = new User("Alice");
        User bob = new User("Bob");
        User carol = new User("Carol");

        alice.join(room);
        bob.join(room);
        carol.join(room);

        alice.send("hello everyone");
        bob.send("hi Alice");
    }
}
