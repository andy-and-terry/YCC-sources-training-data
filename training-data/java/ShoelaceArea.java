public class ShoelaceArea {
    static double area(double[] x, double[] y) {
        double s = 0;
        for (int i = 0; i < x.length; i++) {
            int j = (i + 1) % x.length;
            s += x[i] * y[j] - x[j] * y[i];
        }
        return Math.abs(s) / 2;
    }

    public static void main(String[] args) {
        System.out.println(area(new double[]{0, 4, 4, 0}, new double[]{0, 0, 3, 3}));
    }
}
