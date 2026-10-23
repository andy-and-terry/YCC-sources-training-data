import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class ZeckendorfRepresentation {
    static List<Long> zeckendorf(long n) {
        List<Long> fibs = new ArrayList<>(List.of(1L, 2L));
        while (fibs.get(fibs.size() - 1) <= n) {
            fibs.add(fibs.get(fibs.size() - 1) + fibs.get(fibs.size() - 2));
        }
        List<Long> parts = new ArrayList<>();
        for (int i = fibs.size() - 1; i >= 0; i--) {
            if (fibs.get(i) <= n) {
                parts.add(fibs.get(i));
                n -= fibs.get(i);
            }
        }
        return parts;
    }

    public static void main(String[] args) {
        StringJoiner out = new StringJoiner(" ");
        for (long f : zeckendorf(100)) out.add(Long.toString(f));
        System.out.println(out);
    }
}
