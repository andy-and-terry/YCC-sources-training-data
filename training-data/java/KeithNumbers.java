import java.util.ArrayList;
import java.util.List;

// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
public class KeithNumbers {
    static boolean isKeith(int n) {
        List<Integer> seq = new ArrayList<>();
        for (char c : String.valueOf(n).toCharArray()) seq.add(c - '0');
        int k = seq.size();
        while (seq.get(seq.size() - 1) < n) {
            int sum = 0;
            for (int i = seq.size() - k; i < seq.size(); i++) sum += seq.get(i);
            seq.add(sum);
        }
        return seq.get(seq.size() - 1) == n;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 10; n < 1200; n++) if (isKeith(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
