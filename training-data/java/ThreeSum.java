import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ThreeSum {
    public static List<List<Integer>> find(int[] nums, int target) {
        int[] a = nums.clone();
        Arrays.sort(a);
        List<List<Integer>> res = new ArrayList<>();
        for (int i = 0; i < a.length - 2; i++) {
            if (i > 0 && a[i] == a[i - 1]) continue;
            int lo = i + 1, hi = a.length - 1;
            while (lo < hi) {
                int s = a[i] + a[lo] + a[hi];
                if (s < target) lo++;
                else if (s > target) hi--;
                else {
                    res.add(List.of(a[i], a[lo], a[hi]));
                    while (lo < hi && a[lo] == a[lo + 1]) lo++;
                    while (lo < hi && a[hi] == a[hi - 1]) hi--;
                    lo++;
                    hi--;
                }
            }
        }
        return res;
    }

    public static void main(String[] args) {
        System.out.println(find(new int[] {-1, 0, 1, 2, -1, -4}, 0));
        System.out.println(find(new int[] {1, 2, 3, 4, 5, 6}, 10));
    }
}
