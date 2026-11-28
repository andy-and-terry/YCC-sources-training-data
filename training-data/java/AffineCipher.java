public class AffineCipher {
    static int modInverse(int a, int m) {
        for (int x = 1; x < m; x++) if (a * x % m == 1) return x;
        return 0;
    }

    static String affine(String s, int a, int b, boolean decrypt) {
        int inv = modInverse(a, 26);
        StringBuilder sb = new StringBuilder();
        for (char ch : s.toCharArray()) {
            if (ch >= 'A' && ch <= 'Z') {
                int x = ch - 'A';
                int y = decrypt ? Math.floorMod(inv * (x - b), 26) : (a * x + b) % 26;
                sb.append((char) ('A' + y));
            } else {
                sb.append(ch);
            }
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String c = affine("AFFINE", 5, 8, false);
        System.out.println(c + " " + affine(c, 5, 8, true));
    }
}
