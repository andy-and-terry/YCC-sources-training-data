import java.util.*;

public class VarargsGenericMethod {
    @SafeVarargs
    static <T> List<T> listOf(T... xs) { return new ArrayList<>(Arrays.asList(xs)); }

    public static void main(String[] args) {
        System.out.println(listOf(1, 2, 3));
        System.out.println(listOf("a", "b").size());
    }
}
