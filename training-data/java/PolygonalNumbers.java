import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class PolygonalNumbers {
    // n-th s-gonal number: ((s - 2) n^2 - (s - 4) n) / 2
    static int polygonal(int s, int n) {
        return ((s - 2) * n * n - (s - 4) * n) / 2;
    }

    public static void main(String[] args) {
        String[] names = {"triangular", "pentagonal", "hexagonal"};
        int[] sides = {3, 5, 6};
        for (int i = 0; i < names.length; i++) {
            final int s = sides[i];
            String nums = IntStream.rangeClosed(1, 10)
                    .mapToObj(n -> String.valueOf(polygonal(s, n)))
                    .collect(Collectors.joining(" "));
            System.out.println(names[i] + ": " + nums);
        }
    }
}
