import java.util.Arrays;
import java.util.Comparator;

public class GnomeSort {
    public static <T> void sort(T[] a, Comparator<? super T> cmp) {
        int i = 0;
        while (i < a.length) {
            if (i == 0 || cmp.compare(a[i - 1], a[i]) <= 0) {
                i++;
            } else {
                T t = a[i];
                a[i] = a[i - 1];
                a[i - 1] = t;
                i--;
            }
        }
    }

    public static void main(String[] args) {
        Integer[] nums = {34, 2, 10, -9, 7};
        sort(nums, Comparator.naturalOrder());
        System.out.println(Arrays.toString(nums));
        String[] words = {"delta", "alpha", "charlie", "bravo"};
        sort(words, Comparator.comparing(String::length).thenComparing(Comparator.naturalOrder()));
        System.out.println(Arrays.toString(words));
    }
}
