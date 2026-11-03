public class PowerOfTwoTest {
    static boolean isPowerOfTwo(int n) {
        return n > 0 && (n & (n - 1)) == 0;
    }

    public static void main(String[] args) {
        for (int n = 1; n < 40; n++) if (isPowerOfTwo(n)) System.out.print(n + " ");
        System.out.println();
    }
}
