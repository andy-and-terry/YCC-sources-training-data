import java.util.Optional;

public class OptionalChainingDemo {
    record User(String name, Optional<String> email) {}

    public static void main(String[] args) {
        User u = new User("ada", Optional.of("ADA@X.COM"));
        System.out.println(u.email().map(String::toLowerCase).orElse("none"));
        User v = new User("bob", Optional.empty());
        System.out.println(v.email().or(() -> Optional.of("fallback")).get());
        System.out.println(Optional.ofNullable((String) null).isPresent());
    }
}
