import java.util.Arrays;

public class DeltaEncoding {
    static int[] encode(int[] xs) {
        int[] d = xs.clone();
        for (int i = xs.length - 1; i > 0; i--) d[i] = xs[i] - xs[i - 1];
        return d;
    }

    static int[] decode(int[] ds) {
        int[] out = ds.clone();
        for (int i = 1; i < out.length; i++) out[i] += out[i - 1];
        return out;
    }

    public static void main(String[] args) {
        int[] d = encode(new int[]{10, 12, 15, 15, 20});
        System.out.println(Arrays.toString(d) + " " + Arrays.toString(decode(d)));
    }
}
