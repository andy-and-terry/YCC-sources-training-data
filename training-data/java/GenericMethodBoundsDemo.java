import java.util.Arrays;
import java.util.List;

public class GenericMethodBoundsDemo {
    static <T extends Comparable<T>> T max(List<T> xs) {
        T best = xs.get(0);
        for (T x : xs) if (x.compareTo(best) > 0) best = x;
        return best;
    }

    static <T> void swap(T[] arr, int i, int j) {
        T t = arr[i]; arr[i] = arr[j]; arr[j] = t;
    }

    static double sum(List<? extends Number> xs) {
        double s = 0;
        for (Number n : xs) s += n.doubleValue();
        return s;
    }

    public static void main(String[] args) {
        System.out.println(max(List.of(3, 9, 4)) + " " + max(List.of("pear", "apple")));
        String[] a = {"x", "y", "z"};
        swap(a, 0, 2);
        System.out.println(Arrays.toString(a));
        System.out.println(sum(List.of(1, 2.5, 3L)));
    }
}
