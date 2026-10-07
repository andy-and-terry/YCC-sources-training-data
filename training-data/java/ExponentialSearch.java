import java.util.Arrays;
import java.util.stream.IntStream;

public class ExponentialSearch {
    public static int search(int[] a, int target) {
        if (a.length == 0) return -1;
        if (a[0] == target) return 0;
        int bound = 1;
        while (bound < a.length && a[bound] < target) bound *= 2;
        int idx = Arrays.binarySearch(a, bound / 2, Math.min(bound + 1, a.length), target);
        return idx >= 0 ? idx : -1;
    }

    public static void main(String[] args) {
        int[] data = IntStream.range(0, 67).map(i -> i * 3).toArray();
        System.out.println(search(data, 99) + " " + search(data, 100));
    }
}
