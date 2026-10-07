import java.util.List;

public class CustomFunctionalInterfaceDemo {
    @FunctionalInterface
    interface TriFunction<A, B, C, R> {
        R apply(A a, B b, C c);
    }

    @FunctionalInterface
    interface Validator<T> {
        boolean isValid(T value);

        default Validator<T> and(Validator<T> other) {
            return value -> this.isValid(value) && other.isValid(value);
        }
    }

    public static void main(String[] args) {
        TriFunction<Integer, Integer, Integer, Integer> sumOfThree = (a, b, c) -> a + b + c;
        System.out.println(sumOfThree.apply(1, 2, 3));

        TriFunction<String, String, String, String> joinWithSeparator = (a, b, sep) -> a + sep + b;
        System.out.println(joinWithSeparator.apply("hello", "world", ", "));

        Validator<String> notEmpty = s -> !s.isEmpty();
        Validator<String> maxLength = s -> s.length() <= 10;
        Validator<String> combined = notEmpty.and(maxLength);

        List<String> inputs = List.of("", "ok", "way too long for this");
        for (String input : inputs) {
            System.out.println("'" + input + "' valid: " + combined.isValid(input));
        }
    }
}
