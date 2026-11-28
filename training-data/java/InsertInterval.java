import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class InsertInterval {
    static List<int[]> insert(int[][] iv, int[] n) {
        List<int[]> out = new ArrayList<>();
        int i = 0;
        while (i < iv.length && iv[i][1] < n[0]) out.add(iv[i++]);
        while (i < iv.length && iv[i][0] <= n[1]) {
            n = new int[] {Math.min(n[0], iv[i][0]), Math.max(n[1], iv[i][1])};
            i++;
        }
        out.add(n);
        while (i < iv.length) out.add(iv[i++]);
        return out;
    }

    public static void main(String[] args) {
        for (int[] r : insert(new int[][] {{1, 3}, {6, 9}}, new int[] {2, 5}))
            System.out.print(Arrays.toString(r) + " "); // [1, 5] [6, 9]
        System.out.println();
    }
}
