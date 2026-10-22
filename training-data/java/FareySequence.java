import java.util.ArrayList;
import java.util.List;

public class FareySequence {
    // Farey sequence F_n via the next-term recurrence.
    static List<String> farey(int n) {
        List<String> out = new ArrayList<>();
        int a = 0, b = 1, c = 1, d = n;
        out.add(a + "/" + b);
        while (c <= n) {
            int k = (n + b) / d;
            int na = c, nb = d, nc = k * c - a, nd = k * d - b;
            a = na; b = nb; c = nc; d = nd;
            out.add(a + "/" + b);
            if (a == 1 && b == 1) break;
        }
        return out;
    }

    public static void main(String[] args) {
        System.out.println(String.join(" ", farey(5)));
    }
}
