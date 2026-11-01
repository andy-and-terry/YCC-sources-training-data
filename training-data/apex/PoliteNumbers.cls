public class PoliteNumbers {
    // Ways to write n as a sum of two or more consecutive positive integers.
    public static Integer politeWays(Integer n) {
        Integer ways = 0;
        for (Integer k = 2; k * (k + 1) / 2 <= n; k++) {
            if (Math.mod(n - k * (k - 1) / 2, k) == 0) ways++;
        }
        return ways;
    }

    public static String firstSixteen() {
        List<String> out = new List<String>();
        for (Integer n = 1; n <= 16; n++) out.add(String.valueOf(politeWays(n)));
        return String.join(out, ' ');
    }
}
