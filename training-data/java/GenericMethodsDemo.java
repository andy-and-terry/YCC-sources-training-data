import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.function.Function;

public class GenericMethodsDemo {
    static <T extends Comparable<T>> T max(List<T> items) {
        T best = items.get(0);
        for (T item : items) {
            if (item.compareTo(best) > 0) {
                best = item;
            }
        }
        return best;
    }

    static <T, R> List<R> mapAll(Collection<T> in, Function<? super T, ? extends R> f) {
        List<R> out = new ArrayList<>();
        for (T t : in) {
            out.add(f.apply(t));
        }
        return out;
    }

    @SafeVarargs
    static <T> List<T> listOf(T... items) {
        return new ArrayList<>(Arrays.asList(items));
    }

    static <A, B> void swapPair(Object[] arr, int i, int j) {
        Object tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }

    public static void main(String[] args) {
        System.out.println(max(listOf(3, 9, 4)));
        System.out.println(max(listOf("pear", "apple", "zebra")));
        System.out.println(mapAll(listOf("a", "bb", "ccc"), String::length));

        Object[] arr = {1, "two", 3.0};
        GenericMethodsDemo.<Integer, String>swapPair(arr, 0, 2);
        System.out.println(Arrays.toString(arr));
    }
}
