public class HammingWeight {
    static int popcount(long n) {
        int c = 0;
        while (n != 0) {
            n &= n - 1;
            c++;
        }
        return c;
    }

    public static void main(String[] args) {
        System.out.println(popcount(0b10110111) + " " + Long.bitCount(0b10110111));
    }
}
