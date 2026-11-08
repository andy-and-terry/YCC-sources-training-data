public class Crc8Checksum {
    public static Integer crc8(List<Integer> data) {
        Integer crc = 0;
        for (Integer b : data) {
            crc = crc ^ b;
            for (Integer i = 0; i < 8; i++) {
                if ((crc & 128) != 0) {
                    crc = ((crc << 1) ^ 7) & 255;
                } else {
                    crc = (crc << 1) & 255;
                }
            }
        }
        return crc;
    }
}
