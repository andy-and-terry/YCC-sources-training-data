public class FactorionCheck {
    static final int[] FACT = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};

    static boolean isFactorion(int n) {
        int sum = 0;
        for (int m = n; m > 0; m /= 10) sum += FACT[m % 10];
        return sum == n;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n < 50000; n++) if (isFactorion(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
