import java.util.List;

public class GenericBoundedMax {
    static <T extends Comparable<? super T>> T max(List<? extends T> xs) {
        T best = xs.get(0);
        for (T x : xs) if (x.compareTo(best) > 0) best = x;
        return best;
    }

    public static void main(String[] args) {
        System.out.println(max(List.of(3, 9, 4)));
        System.out.println(max(List.of("pear", "zebra", "apple")));
    }
}
