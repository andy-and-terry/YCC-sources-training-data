// Aliquot sequence: replace n by the sum of its proper divisors.
import java.util.ArrayList;
import java.util.List;

public class AliquotSequence {
    static int aliquotSum(int n) {
        int s = 0;
        for (int d = 1; d <= n / 2; d++) if (n % d == 0) s += d;
        return s;
    }

    public static void main(String[] args) {
        List<Integer> seq = new ArrayList<>(List.of(12));
        while (seq.get(seq.size() - 1) > 1 && seq.size() < 20)
            seq.add(aliquotSum(seq.get(seq.size() - 1)));
        System.out.println(seq);
    }
}
