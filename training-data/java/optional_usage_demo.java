import java.util.Optional;

public class OptionalUsageDemo {
    static Optional<String> find(String k) {
        return "a".equals(k) ? Optional.of("found") : Optional.empty();
    }
    public static void main(String[] args) {
        System.out.println(find("a").map(String::toUpperCase).orElse("none"));
        System.out.println(find("b").orElse("none"));
    }
}
