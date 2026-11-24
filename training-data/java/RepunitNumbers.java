// Repunits: R_n = 11...1 (n ones), built as R_{n-1} * 10 + 1.
import java.math.BigInteger;

public class RepunitNumbers {
    public static void main(String[] args) {
        BigInteger r = BigInteger.ZERO;
        for (int n = 1; n <= 8; n++) {
            r = r.multiply(BigInteger.TEN).add(BigInteger.ONE);
            boolean by3 = r.mod(BigInteger.valueOf(3)).signum() == 0;
            System.out.println(r + (by3 ? "  (divisible by 3)" : ""));
        }
    }
}
