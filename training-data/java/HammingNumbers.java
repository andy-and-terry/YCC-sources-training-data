import java.util.ArrayList;
import java.util.List;

// Hamming numbers (5-smooth), built by merging the x2, x3, x5 streams
public class HammingNumbers {
    public static void main(String[] args) {
        List<Long> h = new ArrayList<>();
        h.add(1L);
        int i2 = 0, i3 = 0, i5 = 0;
        while (h.size() < 20) {
            long next = Math.min(h.get(i2) * 2, Math.min(h.get(i3) * 3, h.get(i5) * 5));
            h.add(next);
            if (next == h.get(i2) * 2) i2++;
            if (next == h.get(i3) * 3) i3++;
            if (next == h.get(i5) * 5) i5++;
        }
        System.out.println(h);
    }
}
