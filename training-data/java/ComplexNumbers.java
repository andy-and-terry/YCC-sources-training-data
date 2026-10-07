public record ComplexNumbers(double re, double im) {
    public static ComplexNumbers polar(double r, double theta) {
        return new ComplexNumbers(r * Math.cos(theta), r * Math.sin(theta));
    }

    public ComplexNumbers plus(ComplexNumbers o) { return new ComplexNumbers(re + o.re, im + o.im); }
    public ComplexNumbers times(ComplexNumbers o) { return new ComplexNumbers(re * o.re - im * o.im, re * o.im + im * o.re); }
    public ComplexNumbers conjugate() { return new ComplexNumbers(re, -im); }
    public double abs() { return Math.hypot(re, im); }

    public ComplexNumbers divide(ComplexNumbers o) {
        double d = o.re * o.re + o.im * o.im;
        ComplexNumbers n = times(o.conjugate());
        return new ComplexNumbers(n.re / d, n.im / d);
    }

    @Override
    public String toString() {
        return String.format("(%.3f %s %.3fi)", re, im >= 0 ? "+" : "-", Math.abs(im));
    }

    /** Counts Mandelbrot iterations before escape for point c. */
    static int mandelbrot(ComplexNumbers c, int maxIter) {
        ComplexNumbers z = new ComplexNumbers(0, 0);
        for (int i = 0; i < maxIter; i++) {
            if (z.abs() > 2) return i;
            z = z.times(z).plus(c);
        }
        return maxIter;
    }

    public static void main(String[] args) {
        ComplexNumbers a = new ComplexNumbers(3, 4), b = new ComplexNumbers(1, -2);
        System.out.println(a.plus(b) + " " + a.times(b) + " " + a.divide(b) + " |a|=" + a.abs());
        for (double y = 1.2; y >= -1.2; y -= 0.2) {
            StringBuilder row = new StringBuilder();
            for (double x = -2.1; x <= 0.6; x += 0.05) row.append(mandelbrot(new ComplexNumbers(x, y), 50) == 50 ? '#' : '.');
            System.out.println(row);
        }
    }
}
