import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.PriorityQueue;

public class MergeSortedArrays {
    /** Merges nums2 into nums1 in place; nums1 has trailing space for nums2. */
    public static void mergeInPlace(int[] nums1, int m, int[] nums2, int n) {
        int i = m - 1, j = n - 1, k = m + n - 1;
        while (j >= 0) nums1[k--] = (i >= 0 && nums1[i] > nums2[j]) ? nums1[i--] : nums2[j--];
    }

    public static List<Integer> mergeK(int[][] arrays) {
        PriorityQueue<int[]> pq = new PriorityQueue<>((x, y) -> Integer.compare(x[0], y[0]));
        for (int i = 0; i < arrays.length; i++) if (arrays[i].length > 0) pq.add(new int[] {arrays[i][0], i, 0});
        List<Integer> out = new ArrayList<>();
        while (!pq.isEmpty()) {
            int[] top = pq.poll();
            out.add(top[0]);
            int[] src = arrays[top[1]];
            if (top[2] + 1 < src.length) pq.add(new int[] {src[top[2] + 1], top[1], top[2] + 1});
        }
        return out;
    }

    public static void main(String[] args) {
        int[] a = {1, 4, 7, 0, 0, 0, 0};
        mergeInPlace(a, 3, new int[] {2, 3, 8, 9}, 4);
        System.out.println(Arrays.toString(a));
        System.out.println(mergeK(new int[][] {{1, 5, 9}, {2, 6}, {}, {0, 3, 4, 10}}));
    }
}
