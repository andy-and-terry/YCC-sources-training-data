import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class OptionalDemo {
    static Optional<String> findUser(Map<Integer, String> users, int id) {
        return Optional.ofNullable(users.get(id));
    }

    public static void main(String[] args) {
        Map<Integer, String> users = new HashMap<>();
        users.put(1, "Alice");

        String result = findUser(users, 1)
            .map(String::toUpperCase)
            .orElse("UNKNOWN");
        System.out.println(result);

        String missing = findUser(users, 999)
            .map(String::toUpperCase)
            .orElseGet(() -> "no user found");
        System.out.println(missing);

        findUser(users, 1).ifPresentOrElse(
            name -> System.out.println("found: " + name),
            () -> System.out.println("not found")
        );
    }
}
