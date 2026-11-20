import java.util.stream.IntStream;

// Manhattan distance between int vectors.
public class ManhattanDistance {
    static int manhattan(int[] a, int[] b) {
        return IntStream.range(0, a.length).map(i -> Math.abs(a[i] - b[i])).sum();
    }

    public static void main(String[] args) {
        System.out.println(manhattan(new int[]{1, 2}, new int[]{4, 6}));
    }
}
