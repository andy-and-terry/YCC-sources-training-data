import java.util.Optional;

public class OptionalChain {
    record User(Optional<String> email) {}

    static Optional<User> find(int id) {
        return id == 1 ? Optional.of(new User(Optional.of("a@x.io"))) : Optional.empty();
    }

    public static void main(String[] args) {
        System.out.println(find(1).flatMap(User::email).map(String::toUpperCase).orElse("none"));
        System.out.println(find(2).flatMap(User::email).orElse("none"));
    }
}
