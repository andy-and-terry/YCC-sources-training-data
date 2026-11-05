import java.util.Optional;

public class OptionalMapFlatMapOrElse {
    static Optional<Integer> parse(String s) {
        try { return Optional.of(Integer.parseInt(s)); } catch (NumberFormatException e) { return Optional.empty(); }
    }

    public static void main(String[] args) {
        System.out.println(parse("12").map(x -> x * 2).orElse(-1));
        System.out.println(parse("zz").map(x -> x * 2).orElse(-1));
        System.out.println(Optional.of("5").flatMap(OptionalMapFlatMapOrElse::parse).isPresent());
    }
}
