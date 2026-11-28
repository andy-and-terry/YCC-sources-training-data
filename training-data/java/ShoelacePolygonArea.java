public class ShoelacePolygonArea {
    static double area(double[][] p) {
        double s = 0;
        for (int i = 0; i < p.length; i++) {
            double[] a = p[i], b = p[(i + 1) % p.length];
            s += a[0] * b[1] - b[0] * a[1];
        }
        return Math.abs(s) / 2;
    }

    public static void main(String[] args) {
        System.out.println(area(new double[][] {{0, 0}, {4, 0}, {4, 3}, {0, 3}}));
    }
}
