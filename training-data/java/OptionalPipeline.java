import java.util.Optional;

public class OptionalPipeline {
    record User(String name, Optional<String> email) {}

    public static void main(String[] args) {
        User u = new User("bob", Optional.of("Bob@Example.com"));
        String domain = u.email()
            .map(String::toLowerCase)
            .filter(e -> e.contains("@"))
            .map(e -> e.substring(e.indexOf('@') + 1))
            .orElse("unknown");
        System.out.println(domain);
    }
}
