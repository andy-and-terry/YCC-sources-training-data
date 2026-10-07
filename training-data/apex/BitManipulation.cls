public class BitManipulation {
    public static Integer countBits(Integer n) {
        Integer count = 0;
        while (n != 0) {
            n &= (n - 1);        // clear lowest set bit
            count++;
        }
        return count;
    }

    public static Boolean isBitSet(Integer n, Integer pos) {
        return (n & (1 << pos)) != 0;
    }

    public static Integer toggleBit(Integer n, Integer pos) {
        return n ^ (1 << pos);
    }

    public static void run() {
        System.debug(countBits(255));       // 8
        System.debug(isBitSet(5, 2));       // true
        System.debug(toggleBit(5, 0));      // 4
        System.debug(6 >> 1);               // 3
        System.debug(6 >>> 1);              // 3
        System.debug(6 << 2);               // 24
    }
}
