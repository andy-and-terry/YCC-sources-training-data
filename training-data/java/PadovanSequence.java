import java.util.Arrays;

// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
public class PadovanSequence {
    static long[] padovan(int count) {
        long[] p = new long[count];
        for (int i = 0; i < count; i++) {
            p[i] = i < 3 ? 1 : p[i - 2] + p[i - 3];
        }
        return p;
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(padovan(15)));
    }
}
