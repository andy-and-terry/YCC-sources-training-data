import java.util.Arrays;

public class SternDiatomic {
    static int[] stern(int count) {
        int[] seq = new int[Math.max(count, 2)];
        seq[1] = 1;
        for (int i = 2; i < count; i++)
            seq[i] = (i % 2 == 0) ? seq[i / 2] : seq[i / 2] + seq[i / 2 + 1];
        return Arrays.copyOf(seq, count);
    }

    public static void main(String[] args) {
        System.out.println(Arrays.toString(stern(15))); // [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
    }
}
