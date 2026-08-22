import java.nio.charset.StandardCharsets;
import java.util.Arrays;

public class XorCipher {
    public static byte[] xorTransform(byte[] data, byte[] key) {
        byte[] result = new byte[data.length];
        for (int i = 0; i < data.length; i++) {
            result[i] = (byte) (data[i] ^ key[i % key.length]);
        }
        return result;
    }

    public static void main(String[] args) {
        byte[] key = "secret".getBytes(StandardCharsets.UTF_8);
        byte[] ciphertext = xorTransform("hello world".getBytes(StandardCharsets.UTF_8), key);
        System.out.println(Arrays.toString(ciphertext));
        System.out.println(new String(xorTransform(ciphertext, key), StandardCharsets.UTF_8));
    }
}
