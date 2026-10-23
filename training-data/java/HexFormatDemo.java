import java.util.Arrays;
import java.util.HexFormat;

public class HexFormatDemo {
    public static void main(String[] args) {
        HexFormat hex = HexFormat.of();
        byte[] data = {0x01, (byte) 0xAB, (byte) 0xFF, 0x10};

        System.out.println(hex.formatHex(data));
        System.out.println(hex.withUpperCase().formatHex(data));
        System.out.println(HexFormat.ofDelimiter(":").formatHex(data));

        byte[] parsed = hex.parseHex("deadbeef");
        System.out.println(Arrays.toString(parsed));

        System.out.println(hex.toHexDigits((byte) 10));
        System.out.println(hex.toHexDigits(255));
        System.out.println(HexFormat.fromHexDigits("ff"));
    }
}
