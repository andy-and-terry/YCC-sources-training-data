public class IntegerUnsignedDemo {
    public static void main(String[] args) {
        int big = 0xFFFFFFF0; // negative as a signed int
        System.out.println("signed:   " + big);
        System.out.println("unsigned: " + Integer.toUnsignedString(big));
        System.out.println("as long:  " + Integer.toUnsignedLong(big));

        // Compare as unsigned values
        System.out.println(Integer.compare(big, 1));           // -1
        System.out.println(Integer.compareUnsigned(big, 1));   // 1

        // Unsigned division and remainder
        System.out.println(Integer.divideUnsigned(big, 16));
        System.out.println(Integer.remainderUnsigned(big, 7));

        // Parsing values above Integer.MAX_VALUE
        int parsed = Integer.parseUnsignedInt("4000000000");
        System.out.println(parsed + " -> " + Integer.toUnsignedString(parsed));

        // Same idea for bytes
        byte b = (byte) 200;
        System.out.println(b + " vs " + Byte.toUnsignedInt(b));
        System.out.println(Long.toUnsignedString(-1L));
    }
}
