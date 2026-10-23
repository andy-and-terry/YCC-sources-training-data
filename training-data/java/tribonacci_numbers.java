import java.util.ArrayList;
import java.util.List;

// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
public class tribonacci_numbers {
    static List<Long> tribonacci(int count) {
        List<Long> t = new ArrayList<>(List.of(0L, 0L, 1L));
        while (t.size() < count) {
            int n = t.size();
            t.add(t.get(n - 1) + t.get(n - 2) + t.get(n - 3));
        }
        return t.subList(0, count);
    }

    public static void main(String[] args) {
        System.out.println("Tribonacci: " + tribonacci(15));
    }
}
