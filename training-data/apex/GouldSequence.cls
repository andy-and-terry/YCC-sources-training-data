public class GouldSequence {
    public static Integer popcount(Integer n) {
        Integer c = 0;
        while (n > 0) {
            c += Math.mod(n, 2);
            n = n / 2;
        }
        return c;
    }

    public static Integer gould(Integer n) {
        return (Integer) Math.pow(2, popcount(n));
    }
}
