import java.util.Arrays;

// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
public class BouncyNumbers {
    static boolean isBouncy(int n) {
        char[] d = String.valueOf(n).toCharArray();
        char[] up = d.clone();
        Arrays.sort(up);
        char[] down = new StringBuilder(new String(up)).reverse().toString().toCharArray();
        return !Arrays.equals(d, up) && !Arrays.equals(d, down);
    }

    public static void main(String[] args) {
        int count = 0;
        for (int n = 1; n < 1000; n++) if (isBouncy(n)) count++;
        System.out.println(count);
    }
}
