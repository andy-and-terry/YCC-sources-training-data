public class Crc8Checksum {
    static int crc8(byte[] data) {
        int crc = 0;
        for (byte b : data) {
            crc ^= b & 0xFF;
            for (int i = 0; i < 8; i++) {
                crc = (crc & 0x80) != 0 ? ((crc << 1) ^ 0x07) & 0xFF : (crc << 1) & 0xFF;
            }
        }
        return crc;
    }

    public static void main(String[] args) {
        System.out.printf("%02x%n", crc8("123456789".getBytes()));
    }
}
