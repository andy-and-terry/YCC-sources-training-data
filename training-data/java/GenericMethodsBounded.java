import java.util.Arrays;
import java.util.List;

public class GenericMethodsBounded {
    static <T extends Comparable<? super T>> T max(List<? extends T> items) {
        T best = items.get(0);
        for (T t : items) if (t.compareTo(best) > 0) best = t;
        return best;
    }

    @SafeVarargs
    static <T> List<T> listOf(T... xs) { return Arrays.asList(xs); }

    static <T> void swap(T[] arr, int i, int j) {
        T tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
    }

    public static void main(String[] args) {
        System.out.println(max(listOf(3, 9, 4)));
        System.out.println(max(listOf("pear", "apple", "zebra")));
        String[] s = {"a", "b", "c"};
        swap(s, 0, 2);
        System.out.println(Arrays.toString(s));
    }
}
