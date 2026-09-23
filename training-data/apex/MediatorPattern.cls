public class MediatorPattern {
    public interface ChatMediator {
        void sendMessage(String message, ChatUser sender);
        void addUser(ChatUser user);
    }

    public class ChatRoom implements ChatMediator {
        private List<ChatUser> users = new List<ChatUser>();

        public void addUser(ChatUser user) {
            users.add(user);
        }

        public void sendMessage(String message, ChatUser sender) {
            for (ChatUser u : users) {
                if (u != sender) {
                    u.receive(message);
                }
            }
        }
    }

    public class ChatUser {
        private String userName;
        private ChatMediator mediator;

        public ChatUser(String userName, ChatMediator mediator) {
            this.userName = userName;
            this.mediator = mediator;
        }

        public void send(String message) {
            System.debug(userName + ' sends: ' + message);
            mediator.sendMessage(message, this);
        }

        public void receive(String message) {
            System.debug(userName + ' received: ' + message);
        }
    }

    public static void main() {
        ChatRoom room = new ChatRoom();
        ChatUser alice = new ChatUser('Alice', room);
        ChatUser bob = new ChatUser('Bob', room);
        room.addUser(alice);
        room.addUser(bob);
        alice.send('Hello Bob!');
    }
}
