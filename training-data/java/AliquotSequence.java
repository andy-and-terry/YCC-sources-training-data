import java.util.ArrayList;
import java.util.List;

public class AliquotSequence {
    static int properDivisorSum(int n) {
        int total = 0;
        for (int d = 1; d < n; d++) {
            if (n % d == 0) total += d;
        }
        return total;
    }

    static List<Integer> aliquot(int start) {
        List<Integer> seq = new ArrayList<>();
        seq.add(start);
        while (seq.get(seq.size() - 1) != 0) seq.add(properDivisorSum(seq.get(seq.size() - 1)));
        return seq;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int v : aliquot(12)) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
