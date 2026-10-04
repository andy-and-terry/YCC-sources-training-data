public class BitwiseOperationsDemo {
    public static Integer countSetBits(Integer n) {
        Integer count = 0;
        while (n != 0) {
            count += n & 1;
            n = n >>> 1;
        }
        return count;
    }

    public static Boolean isBitSet(Integer n, Integer pos) {
        return (n & (1 << pos)) != 0;
    }

    public static void main() {
        Integer a = 12; // 1100
        Integer b = 10; // 1010
        System.debug('a & b = ' + (a & b));
        System.debug('a | b = ' + (a | b));
        System.debug('a ^ b = ' + (a ^ b));
        System.debug('a << 2 = ' + (a << 2));
        System.debug('a >> 1 = ' + (a >> 1));
        System.debug('bits in 255 = ' + countSetBits(255));
        System.debug('bit 2 of 12 set? ' + isBitSet(12, 2));
    }
}
