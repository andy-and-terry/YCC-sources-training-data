public class Fletcher16Checksum {
    static int fletcher16(byte[] data) {
        int s1 = 0, s2 = 0;
        for (byte b : data) {
            s1 = (s1 + (b & 0xff)) % 255;
            s2 = (s2 + s1) % 255;
        }
        return (s2 << 8) | s1;
    }

    public static void main(String[] args) {
        System.out.println(Integer.toHexString(fletcher16("abcde".getBytes())));
    }
}
