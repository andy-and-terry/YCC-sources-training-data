import java.math.BigInteger;

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
public class RepunitNumbers {
    public static void main(String[] args) {
        BigInteger r = BigInteger.ZERO;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            r = r.multiply(BigInteger.TEN).add(BigInteger.ONE);
            sb.append(r).append(' ');
        }
        System.out.println(sb.toString().trim());
    }
}
