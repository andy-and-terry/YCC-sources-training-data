import java.math.BigInteger;

// Leyland numbers: x^y + y^x for x >= y >= 2.
public class LeylandNumbers {
    static BigInteger leyland(int x, int y) {
        return BigInteger.valueOf(x).pow(y).add(BigInteger.valueOf(y).pow(x));
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int x = 2; x <= 4; x++)
            for (int y = 2; y <= x; y++)
                sb.append(leyland(x, y)).append(' ');
        System.out.println(sb.toString().trim());
    }
}
