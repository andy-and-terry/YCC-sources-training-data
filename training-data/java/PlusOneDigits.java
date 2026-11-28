import java.util.Arrays;

public class PlusOneDigits {
    static int[] plusOne(int[] d) {
        int[] out = d.clone();
        for (int i = out.length - 1; i >= 0; i--) {
            if (out[i] < 9) {
                out[i]++;
                return out;
            }
            out[i] = 0;
        }
        int[] grown = new int[out.length + 1];
        grown[0] = 1;
        return grown;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(plusOne(new int[] {1, 2, 9}))); // [1, 3, 0]
        System.out.println(Arrays.toString(plusOne(new int[] {9, 9}))); // [1, 0, 0]
    }
}
