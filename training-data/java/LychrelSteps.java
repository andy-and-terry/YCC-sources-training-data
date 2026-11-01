import java.math.BigInteger;
import java.util.StringJoiner;

// Reverse-and-add until a palindrome; count the steps.
public class LychrelSteps {
    static BigInteger reverse(BigInteger n) {
        return new BigInteger(new StringBuilder(n.toString()).reverse().toString());
    }

    static int steps(long start) {
        BigInteger n = BigInteger.valueOf(start);
        for (int count = 0; count < 100; count++) {
            if (count > 0 && n.equals(reverse(n))) return count;
            n = n.add(reverse(n));
        }
        return -1;
    }

    public static void main(String[] args) {
        StringJoiner j = new StringJoiner(" ");
        for (long n : new long[] {56, 57, 59, 79, 89}) j.add(Integer.toString(steps(n)));
        System.out.println(j);
    }
}
