import java.util.HashMap;
import java.util.Map;

public class FourSumCount {
    static int count(int[] a, int[] b, int[] c, int[] d) {
        Map<Integer, Integer> sums = new HashMap<>();
        for (int x : a) for (int y : b) sums.merge(x + y, 1, Integer::sum);
        int total = 0;
        for (int x : c) for (int y : d) total += sums.getOrDefault(-(x + y), 0);
        return total;
    }

    public static void main(String[] args) {
        System.out.println(count(new int[] {1, 2}, new int[] {-2, -1}, new int[] {-1, 2}, new int[] {0, 2})); // 2
    }
}
