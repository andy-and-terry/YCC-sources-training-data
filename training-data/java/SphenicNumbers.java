public class SphenicNumbers {
    static boolean isSphenic(int n) {
        int distinct = 0;
        for (int p = 2; p * p <= n; p++) {
            if (n % p == 0) {
                n /= p;
                if (n % p == 0) return false;
                distinct++;
            }
        }
        return distinct + (n > 1 ? 1 : 0) == 3;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 2; n < 80; n++) if (isSphenic(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
