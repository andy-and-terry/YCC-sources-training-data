import java.io.ByteArrayOutputStream;

public class VarintEncode {
    static byte[] varint(long n) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        while (n >= 0x80) {
            out.write((int) ((n & 0x7F) | 0x80));
            n >>>= 7;
        }
        out.write((int) n);
        return out.toByteArray();
    }

    public static void main(String[] args) {
        for (byte b : varint(300)) System.out.printf("%02x ", b);
        System.out.println();
    }
}
