import java.util.StringJoiner;

// n is triangular iff 8n + 1 is a perfect square.
public class TriangularCheck {
    static boolean isTriangular(int n) {
        int s = 8 * n + 1;
        int r = (int) Math.round(Math.sqrt(s));
        return r * r == s;
    }

    public static void main(String[] args) {
        StringJoiner j = new StringJoiner(" ");
        for (int n = 0; n <= 20; n++)
            if (isTriangular(n)) j.add(Integer.toString(n));
        System.out.println(j);
    }
}
