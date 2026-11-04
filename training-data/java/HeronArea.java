public class HeronArea {
    static double heron(double a, double b, double c) {
        if (a + b <= c || a + c <= b || b + c <= a)
            throw new IllegalArgumentException("not a triangle");
        double s = (a + b + c) / 2;
        return Math.sqrt(s * (s - a) * (s - b) * (s - c));
    }

    public static void main(String[] args) {
        System.out.println(heron(3, 4, 5));
        try {
            heron(1, 2, 10);
        } catch (IllegalArgumentException e) {
            System.out.println("error: " + e.getMessage());
        }
    }
}
