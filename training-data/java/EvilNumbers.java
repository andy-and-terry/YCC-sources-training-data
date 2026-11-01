import java.util.StringJoiner;

// Evil numbers have an even number of 1 bits.
public class EvilNumbers {
    public static void main(String[] args) {
        StringJoiner j = new StringJoiner(" ");
        for (int n = 0; n <= 20; n++)
            if (Integer.bitCount(n) % 2 == 0) j.add(Integer.toString(n));
        System.out.println(j);
    }
}
