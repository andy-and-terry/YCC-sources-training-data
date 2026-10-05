import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class MergeIntervals {
    public static int[][] merge(int[][] intervals) {
        int[][] sorted = intervals.clone();
        Arrays.sort(sorted, (a, b) -> Integer.compare(a[0], b[0]));
        List<int[]> out = new ArrayList<>();
        for (int[] iv : sorted) {
            if (out.isEmpty() || out.get(out.size() - 1)[1] < iv[0]) {
                out.add(iv.clone());
            } else {
                int[] last = out.get(out.size() - 1);
                last[1] = Math.max(last[1], iv[1]);
            }
        }
        return out.toArray(new int[0][]);
    }

    public static void main(String[] args) {
        int[][] result = merge(new int[][] {{1, 3}, {8, 10}, {2, 6}, {15, 18}});
        System.out.println(Arrays.deepToString(result));
    }
}
