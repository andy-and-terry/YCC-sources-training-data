import java.util.Arrays;
import java.util.Comparator;

public class RailFenceCipher {
    static Integer[] order(int n, int k) {
        int cycle = 2 * (k - 1);
        Integer[] idx = new Integer[n];
        for (int i = 0; i < n; i++) idx[i] = i;
        Arrays.sort(idx, Comparator.comparingInt(i -> {
            int r = i % cycle;
            return r < k ? r : cycle - r;
        }));
        return idx;
    }

    static String encrypt(String t, int k) {
        StringBuilder sb = new StringBuilder();
        for (int i : order(t.length(), k)) sb.append(t.charAt(i));
        return sb.toString();
    }

    static String decrypt(String c, int k) {
        char[] out = new char[c.length()];
        Integer[] idx = order(c.length(), k);
        for (int pos = 0; pos < idx.length; pos++) out[idx[pos]] = c.charAt(pos);
        return new String(out);
    }

    public static void main(String[] args) {
        String c = encrypt("WEAREDISCOVERED", 3);
        System.out.println(c + " " + decrypt(c, 3));
    }
}
