import java.util.Optional;

public class OptionalMapFilterOrElse {
    static Optional<String> find(int id) {
        return id == 1 ? Optional.of("  alice ") : Optional.empty();
    }

    public static void main(String[] args) {
        System.out.println(find(1).map(String::trim).map(String::toUpperCase).orElse("none"));
        System.out.println(find(2).map(String::trim).orElse("none"));
        System.out.println(find(1).filter(s -> s.length() > 20).isPresent());
        find(1).ifPresentOrElse(s -> System.out.println("got" + s), () -> System.out.println("missing"));
        System.out.println(find(2).or(() -> Optional.of("fallback")).get());
    }
}
