// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
import java.util.StringJoiner;

public class jacobsthal_numbers {
    public static void main(String[] args) {
        long a = 0, b = 1;
        StringJoiner out = new StringJoiner(" ");
        for (int i = 0; i < 15; i++) {
            out.add(Long.toString(a));
            long next = b + 2 * a;
            a = b;
            b = next;
        }
        System.out.println(out);
    }
}
