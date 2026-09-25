import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public class CatalanNumbers {
    public static List<BigInteger> dp(int n) {
        List<BigInteger> c = new ArrayList<>();
        c.add(BigInteger.ONE);
        for (int i = 1; i <= n; i++) {
            BigInteger sum = BigInteger.ZERO;
            for (int j = 0; j < i; j++) sum = sum.add(c.get(j).multiply(c.get(i - 1 - j)));
            c.add(sum);
        }
        return c;
    }

    public static BigInteger closedForm(int n) {
        BigInteger c = BigInteger.ONE;
        for (int k = 0; k < n; k++) {
            c = c.multiply(BigInteger.valueOf(2L * (2 * k + 1))).divide(BigInteger.valueOf(k + 2));
        }
        return c;
    }

    public static void main(String[] args) {
        List<BigInteger> c = dp(30);
        System.out.println(c.subList(0, 12));
        System.out.println("C(30) = " + c.get(30) + " closed form agrees: " + c.get(30).equals(closedForm(30)));
    }
}
