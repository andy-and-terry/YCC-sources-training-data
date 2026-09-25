import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CombinationSum {
    public static List<List<Integer>> find(int[] candidates, int target) {
        int[] c = candidates.clone();
        Arrays.sort(c);
        List<List<Integer>> out = new ArrayList<>();
        backtrack(c, 0, target, new ArrayList<>(), out);
        return out;
    }

    private static void backtrack(int[] c, int start, int remaining, List<Integer> path, List<List<Integer>> out) {
        if (remaining == 0) {
            out.add(List.copyOf(path));
            return;
        }
        for (int i = start; i < c.length && c[i] <= remaining; i++) {
            path.add(c[i]);
            backtrack(c, i, remaining - c[i], path, out);
            path.remove(path.size() - 1);
        }
    }

    public static void main(String[] args) {
        System.out.println(find(new int[] {2, 3, 6, 7}, 7));
        System.out.println(find(new int[] {2, 3, 5}, 8));
    }
}
