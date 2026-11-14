import java.util.function.Function;

public class ComposeDemo {
    @FunctionalInterface
    interface Transform<T> extends Function<T, T> {
        default Transform<T> then(Transform<T> o) { return x -> o.apply(apply(x)); }
    }

    public static void main(String[] args) {
        Transform<String> trim = String::trim;
        Transform<String> up = String::toUpperCase;
        System.out.println(trim.then(up).apply("  hello "));
    }
}
