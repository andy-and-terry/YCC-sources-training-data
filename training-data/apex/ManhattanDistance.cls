// Manhattan distance of two vectors.
public class ManhattanDistance {
    public static Integer distance(List<Integer> a, List<Integer> b) {
        Integer s = 0;
        for (Integer i = 0; i < a.size(); i++) { s += Math.abs(a[i] - b[i]); }
        return s;
    }
}
