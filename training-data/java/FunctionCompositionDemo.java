import java.util.function.Function;
import java.util.function.Predicate;

public class FunctionCompositionDemo {
    public static void main(String[] args) {
        Function<Integer, Integer> doubleIt = x -> x * 2;
        Function<Integer, Integer> addTen = x -> x + 10;

        System.out.println(doubleIt.andThen(addTen).apply(5));
        System.out.println(doubleIt.compose(addTen).apply(5));

        Predicate<String> notEmpty = s -> !s.isEmpty();
        Predicate<String> shortWord = s -> s.length() < 5;
        Predicate<String> both = notEmpty.and(shortWord);
        System.out.println(both.test("abc") + " " + both.test("abcdef") + " " + both.negate().test(""));
        System.out.println(Function.<String>identity().apply("same"));
    }
}
