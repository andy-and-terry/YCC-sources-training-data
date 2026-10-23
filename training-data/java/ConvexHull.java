import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class ConvexHull {
    static long cross(int[] o, int[] a, int[] b) {
        return (long) (a[0] - o[0]) * (b[1] - o[1]) - (long) (a[1] - o[1]) * (b[0] - o[0]);
    }

    // Andrew's monotone chain, counter-clockwise result
    static List<int[]> hull(int[][] pts) {
        int[][] p = pts.clone();
        Arrays.sort(p, Comparator.<int[]>comparingInt(q -> q[0]).thenComparingInt(q -> q[1]));
        List<int[]> h = new ArrayList<>();
        for (int[] q : p) {
            while (h.size() >= 2 && cross(h.get(h.size() - 2), h.get(h.size() - 1), q) <= 0) h.remove(h.size() - 1);
            h.add(q);
        }
        int lower = h.size() + 1;
        for (int i = p.length - 2; i >= 0; i--) {
            while (h.size() >= lower && cross(h.get(h.size() - 2), h.get(h.size() - 1), p[i]) <= 0) h.remove(h.size() - 1);
            h.add(p[i]);
        }
        h.remove(h.size() - 1);
        return h;
    }

    public static void main(String[] args) {
        int[][] pts = {{0, 0}, {2, 0}, {1, 1}, {2, 2}, {0, 2}, {1, 3}};
        for (int[] q : hull(pts)) System.out.println(Arrays.toString(q));
    }
}
