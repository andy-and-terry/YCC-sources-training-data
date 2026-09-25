public class GrayCode {
    public static int encode(int n) { return n ^ (n >>> 1); }

    public static int decode(int g) {
        int b = 0;
        for (; g != 0; g >>>= 1) b ^= g;
        return b;
    }

    public static void main(String[] args) {
        int bits = 4;
        for (int i = 0; i < (1 << bits); i++) {
            int g = encode(i);
            String s = String.format("%" + bits + "s", Integer.toBinaryString(g)).replace(' ', '0');
            System.out.println(i + "\t" + s + "\t" + decode(g));
            if (i > 0 && Integer.bitCount(g ^ encode(i - 1)) != 1) throw new AssertionError();
        }
    }
}
