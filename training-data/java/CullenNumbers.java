import java.util.StringJoiner;

public class CullenNumbers {
    public static void main(String[] args) {
        StringJoiner out = new StringJoiner(" ");
        for (long n = 0; n < 10; n++) {
            out.add(Long.toString(n * (1L << n) + 1));
        }
        System.out.println(out);
    }
}
