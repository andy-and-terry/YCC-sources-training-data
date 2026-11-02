import java.util.Optional;

public class OptionalChaining {
    record User(String name, Optional<String> email) {}

    public static void main(String[] args) {
        User u = new User("ann", Optional.empty());
        System.out.println(u.email().map(String::toUpperCase).orElse("no email"));
    }
}
