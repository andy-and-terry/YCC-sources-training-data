import java.util.function.*;

public class FunctionalInterfacesComposed {
    public static void main(String[] args) {
        Function<Integer, Integer> inc = x -> x + 1, dbl = x -> x * 2;
        System.out.println(inc.andThen(dbl).apply(3) + " " + inc.compose(dbl).apply(3));
        Predicate<String> empty = String::isEmpty;
        System.out.println(empty.negate().and(s -> s.length() < 4).test("abc"));
        BiFunction<Integer, Integer, Integer> add = Integer::sum;
        Supplier<String> sup = () -> "lazy";
        UnaryOperator<String> up = String::toUpperCase;
        System.out.println(add.apply(2, 3) + sup.get() + up.apply("x"));
    }
}
