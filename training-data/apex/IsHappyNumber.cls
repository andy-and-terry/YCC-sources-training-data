public class IsHappyNumber {
    private static Integer nextValue(Integer n) {
        Integer sum = 0;
        while (n > 0) {
            Integer d = Math.mod(n, 10);
            sum += d * d;
            n = n / 10;
        }
        return sum;
    }

    public static Boolean isHappy(Integer n) {
        Set<Integer> seen = new Set<Integer>();
        while (n != 1 && seen.add(n)) {
            n = nextValue(n);
        }
        return n == 1;
    }

    public static void main() {
        System.debug(isHappy(19));
        System.debug(isHappy(4));
    }
}
