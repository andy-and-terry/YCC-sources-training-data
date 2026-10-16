import java.util.List;
import java.util.function.BiFunction;
import java.util.function.Function;
import java.util.function.Supplier;

public class MethodReferenceKinds {
    private final String prefix;

    MethodReferenceKinds(String prefix) {
        this.prefix = prefix;
    }

    String tag(String s) {
        return prefix + s;
    }

    static int twice(int x) {
        return 2 * x;
    }

    public static void main(String[] args) {
        Function<Integer, Integer> staticRef = MethodReferenceKinds::twice;
        MethodReferenceKinds obj = new MethodReferenceKinds("#");
        Function<String, String> boundRef = obj::tag;
        Function<String, Integer> unboundRef = String::length;
        Supplier<StringBuilder> ctorRef = StringBuilder::new;
        BiFunction<String, Integer, Character> charAt = String::charAt;
        Function<String, MethodReferenceKinds> factory = MethodReferenceKinds::new;

        System.out.println(staticRef.apply(21));
        System.out.println(boundRef.apply("tag"));
        System.out.println(unboundRef.apply("hello"));
        System.out.println(ctorRef.get().append("built"));
        System.out.println(charAt.apply("xyz", 1));
        System.out.println(factory.apply("@").tag("x"));
        List.of("a", "b").forEach(System.out::println);
    }
}
