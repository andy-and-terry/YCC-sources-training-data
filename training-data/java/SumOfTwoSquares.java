import java.util.StringJoiner;

// Positive n expressible as a*a + b*b with a, b >= 0.
public class SumOfTwoSquares {
    static boolean representable(int n) {
        for (int a = 0; a * a <= n; a++)
            for (int b = a; a * a + b * b <= n; b++)
                if (a * a + b * b == n) return true;
        return false;
    }

    public static void main(String[] args) {
        StringJoiner j = new StringJoiner(" ");
        for (int n = 1; n <= 30; n++)
            if (representable(n)) j.add(Integer.toString(n));
        System.out.println(j);
    }
}
