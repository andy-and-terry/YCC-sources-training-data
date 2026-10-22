import java.math.BigInteger;

// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
public class SylvesterSequence {
    public static void main(String[] args) {
        BigInteger s = BigInteger.TWO;
        for (int i = 0; i < 8; i++) {
            System.out.println("s(" + i + ") = " + s);
            s = s.multiply(s).subtract(s).add(BigInteger.ONE);
        }
    }
}
