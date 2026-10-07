import java.math.BigInteger;

public class ClimbingStairs {
    public static BigInteger ways(int n, int... steps) {
        BigInteger[] dp = new BigInteger[n + 1];
        dp[0] = BigInteger.ONE;
        for (int i = 1; i <= n; i++) {
            dp[i] = BigInteger.ZERO;
            for (int s : steps) if (s <= i) dp[i] = dp[i].add(dp[i - s]);
        }
        return dp[n];
    }

    public static int minCost(int[] cost) {
        int a = 0, b = 0;
        for (int c : cost) {
            int next = Math.min(a, b) + c;
            a = b;
            b = next;
        }
        return Math.min(a, b);
    }

    public static void main(String[] args) {
        for (int n = 1; n <= 10; n++) System.out.print(ways(n, 1, 2) + " ");
        System.out.println();
        System.out.println(ways(100, 1, 2) + " " + ways(10, 1, 3, 5));
        System.out.println(minCost(new int[] {1, 100, 1, 1, 1, 100, 1, 1, 100, 1}));
    }
}
