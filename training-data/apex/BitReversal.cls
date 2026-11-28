public class BitReversal {
    public static Integer reverseByte(Integer value) {
        Integer result = 0;
        for (Integer i = 0; i < 8; i++) {
            result = (result << 1) | (value & 1);
            value = value >> 1;
        }
        return result; // 1 -> 128, 6 -> 96, 13 -> 176, 128 -> 1
    }
}
