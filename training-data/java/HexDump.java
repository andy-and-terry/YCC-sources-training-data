import java.nio.charset.StandardCharsets;

public class HexDump {
    static void dump(byte[] data) {
        for (int off = 0; off < data.length; off += 16) {
            StringBuilder hex = new StringBuilder(), text = new StringBuilder();
            for (int i = off; i < Math.min(off + 16, data.length); i++) {
                hex.append(String.format("%02x ", data[i]));
                text.append(data[i] >= 32 && data[i] < 127 ? (char) data[i] : '.');
            }
            System.out.printf("%08x  %-48s |%s|%n", off, hex, text);
        }
    }

    public static void main(String[] args) {
        dump("Hello, hex dump!\n\u0001\u0002 end".getBytes(StandardCharsets.US_ASCII));
    }
}
