public class PowerOfTwo {
    public static Boolean isPowerOfTwo(Integer n) {
        return n > 0 && (n & (n - 1)) == 0;
    }

    public static void main() {
        for (Integer n : new List<Integer>{1, 2, 3, 16, 18}) {
            System.debug(n + ': ' + isPowerOfTwo(n));
        }
    }
}
