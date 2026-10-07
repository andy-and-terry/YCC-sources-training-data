import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.function.Function;

public class GenericMethodsDemo {
    static <T extends Comparable<T>> T maxOf(List<T> items) {
        T best = items.get(0);
        for (T item : items) if (item.compareTo(best) > 0) best = item;
        return best;
    }

    static <T, R> List<R> mapAll(List<T> items, Function<? super T, ? extends R> f) {
        List<R> out = new ArrayList<>();
        for (T item : items) out.add(f.apply(item));
        return out;
    }

    @SafeVarargs
    static <T> List<T> listOf(T... items) {
        return new ArrayList<>(List.of(items));
    }

    public static void main(String[] args) {
        System.out.println(maxOf(listOf(3, 9, 4)));
        System.out.println(maxOf(listOf("pear", "apple", "zebra")));
        System.out.println(mapAll(listOf("a", "bb", "ccc"), String::length));
        List<String> words = listOf("delta", "alpha", "charlie");
        words.sort(Comparator.naturalOrder());
        System.out.println(words);
    }
}
