import java.util.List;

public class GenericBoundedMax {
    static <T extends Comparable<? super T>> T max(List<? extends T> items) {
        T best = items.get(0);
        for (T item : items) {
            if (item.compareTo(best) > 0) best = item;
        }
        return best;
    }

    public static void main(String[] args) {
        System.out.println(max(List.of(3, 9, 4)));
        System.out.println(max(List.of("pear", "apple", "zebra")));
    }
}
