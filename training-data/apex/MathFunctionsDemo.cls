public class MathFunctionsDemo {
    public static Integer clamp(Integer v, Integer lo, Integer hi) {
        return Math.max(lo, Math.min(hi, v));
    }

    public static Decimal percentOf(Decimal part, Decimal whole) {
        if (whole == 0) {
            return 0;
        }
        return (part / whole * 100).setScale(1);
    }

    public static void main() {
        System.debug(Math.abs(-7));
        System.debug(Math.pow(2, 10));
        System.debug(Math.sqrt(144));
        System.debug(Math.cbrt(27));
        System.debug(Math.ceil(4.2));
        System.debug(Math.floor(4.8));
        System.debug(Math.round(2.5));
        System.debug(Math.rint(2.5));
        System.debug(Math.mod(-7, 3));
        System.debug(Math.remainder(7, 3));
        System.debug(Math.signum(-3.5));
        System.debug(Math.log10(1000));
        System.debug(Math.exp(0));
        System.debug(clamp(150, 0, 100));
        System.debug(percentOf(45, 60));
        System.debug(Math.floorMod(-7, 3));
        System.debug(Math.hypot(3, 4));
        Integer r = Math.round(Math.random() * 10);
        System.debug(r >= 0 && r <= 10);
    }
}
