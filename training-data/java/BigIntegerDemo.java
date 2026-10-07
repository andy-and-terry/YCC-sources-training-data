import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;

public class BigIntegerDemo {
    static BigInteger factorial(int n) {
        BigInteger r = BigInteger.ONE;
        for (int i = 2; i <= n; i++) r = r.multiply(BigInteger.valueOf(i));
        return r;
    }

    public static void main(String[] args) {
        System.out.println(factorial(30));
        BigInteger a = new BigInteger("123456789012345678901234567890");
        System.out.println(a.mod(BigInteger.valueOf(97)) + " " + a.isProbablePrime(10));
        System.out.println(BigInteger.TWO.modPow(BigInteger.valueOf(100), BigInteger.valueOf(1000007)));

        BigDecimal x = new BigDecimal("10");
        System.out.println(x.divide(new BigDecimal("3"), 5, RoundingMode.HALF_UP));
        System.out.println(new BigDecimal("0.1").add(new BigDecimal("0.2")));
    }
}
