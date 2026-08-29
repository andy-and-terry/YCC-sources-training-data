public class PowerFunction {
    public static Long power(Integer base, Integer exp) {
        if (exp == 0) {
            return 1;
        }
        Long half = power(base, exp / 2);
        if (Math.mod(exp, 2) == 0) {
            return half * half;
        }
        return base * half * half;
    }

    public static void main() {
        System.debug(power(2, 10));
    }
}
