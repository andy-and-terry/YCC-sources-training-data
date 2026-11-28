public class AutomorphicNumbers {
    static boolean isAutomorphic(long n) {
        return Long.toString(n * n).endsWith(Long.toString(n));
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (long n = 0; n < 1000; n++) if (isAutomorphic(n)) sb.append(n).append(' ');
        System.out.println(sb); // 0 1 5 6 25 76 376 625
    }
}
