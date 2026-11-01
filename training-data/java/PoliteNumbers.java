import java.util.StringJoiner;

// Ways to write n as a sum of two or more consecutive positive integers.
public class PoliteNumbers {
    static int politeWays(int n) {
        int ways = 0;
        for (int k = 2; k * (k + 1) / 2 <= n; k++)
            if ((n - k * (k - 1) / 2) % k == 0) ways++;
        return ways;
    }

    public static void main(String[] args) {
        StringJoiner j = new StringJoiner(" ");
        for (int n = 1; n <= 16; n++) j.add(Integer.toString(politeWays(n)));
        System.out.println(j);
    }
}
