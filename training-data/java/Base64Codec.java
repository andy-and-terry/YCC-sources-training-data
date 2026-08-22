import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class Base64Codec {
    public static String encode(byte[] data) {
        return Base64.getEncoder().encodeToString(data);
    }

    public static byte[] decode(String text) {
        return Base64.getDecoder().decode(text);
    }

    public static void main(String[] args) {
        String encoded = encode("hello world".getBytes(StandardCharsets.UTF_8));
        System.out.println(encoded);
        System.out.println(new String(decode(encoded), StandardCharsets.UTF_8));
    }
}
