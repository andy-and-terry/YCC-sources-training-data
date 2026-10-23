public class ExactArithmeticDemo {
    static String tryAdd(int a, int b) {
        try {
            return String.valueOf(Math.addExact(a, b));
        } catch (ArithmeticException e) {
            return "overflow: " + e.getMessage();
        }
    }

    public static void main(String[] args) {
        System.out.println(Integer.MAX_VALUE + 1);
        System.out.println(tryAdd(1, 2));
        System.out.println(tryAdd(Integer.MAX_VALUE, 1));

        try {
            Math.multiplyExact(1L << 62, 4L);
        } catch (ArithmeticException e) {
            System.out.println("long " + e.getMessage());
        }

        try {
            Math.toIntExact(1L << 40);
        } catch (ArithmeticException e) {
            System.out.println(e.getMessage());
        }

        System.out.println(Math.floorDiv(-7, 2) + " " + (-7 / 2));
        System.out.println(Math.floorMod(-7, 3) + " " + (-7 % 3));
    }
}
