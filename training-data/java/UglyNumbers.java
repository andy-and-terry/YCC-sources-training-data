import java.util.ArrayList;
import java.util.List;

public class UglyNumbers {
    static long ugly(int n) {
        List<Long> seq = new ArrayList<>(List.of(1L));
        int i2 = 0, i3 = 0, i5 = 0;
        while (seq.size() < n) {
            long next = Math.min(seq.get(i2) * 2, Math.min(seq.get(i3) * 3, seq.get(i5) * 5));
            seq.add(next);
            if (next == seq.get(i2) * 2) i2++;
            if (next == seq.get(i3) * 3) i3++;
            if (next == seq.get(i5) * 5) i5++;
        }
        return seq.get(n - 1);
    }

    public static void main(String[] args) {
        for (int i = 1; i <= 12; i++) System.out.print(ugly(i) + " ");
        System.out.println();
    }
}
