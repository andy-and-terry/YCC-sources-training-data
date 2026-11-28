public class RollingHash {
    public static void main(String[] args) {
        String s = "abcabc";
        int k = 3;
        long B = 31, M = 1000003, pw = 1, h = 0;
        for (int i = 1; i < k; i++) pw = pw * B % M;
        for (int i = 0; i < k; i++) h = (h * B + s.charAt(i)) % M;
        System.out.println("0 " + h);
        for (int i = 1; i + k <= s.length(); i++) {
            h = (h - s.charAt(i - 1) * pw % M + M) % M;
            h = (h * B + s.charAt(i + k - 1)) % M;
            System.out.println(i + " " + h);
        }
    }
}
