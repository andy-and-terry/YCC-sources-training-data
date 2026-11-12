import java.util.Optional;

public class OptionalMapFlatMap {
    static Optional<String> find(int id) { return id == 1 ? Optional.of("alice") : Optional.empty(); }

    public static void main(String[] args) {
        System.out.println(find(1).map(String::toUpperCase).orElse("none"));
        System.out.println(find(2).flatMap(s -> Optional.of(s.length())).orElse(-1));
    }
}
