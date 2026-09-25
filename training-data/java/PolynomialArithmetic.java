import java.util.Arrays;

public final class PolynomialArithmetic {
    private final long[] c; // c[i] = coefficient of x^i

    public PolynomialArithmetic(long... coeffs) {
        int n = coeffs.length;
        while (n > 1 && coeffs[n - 1] == 0) n--;
        c = Arrays.copyOf(coeffs, Math.max(n, 1));
    }

    public int degree() { return c.length - 1; }

    public PolynomialArithmetic plus(PolynomialArithmetic o) {
        long[] r = new long[Math.max(c.length, o.c.length)];
        for (int i = 0; i < r.length; i++) r[i] = (i < c.length ? c[i] : 0) + (i < o.c.length ? o.c[i] : 0);
        return new PolynomialArithmetic(r);
    }

    public PolynomialArithmetic times(PolynomialArithmetic o) {
        long[] r = new long[c.length + o.c.length - 1];
        for (int i = 0; i < c.length; i++) for (int j = 0; j < o.c.length; j++) r[i + j] += c[i] * o.c[j];
        return new PolynomialArithmetic(r);
    }

    public PolynomialArithmetic derivative() {
        if (c.length == 1) return new PolynomialArithmetic(0);
        long[] r = new long[c.length - 1];
        for (int i = 1; i < c.length; i++) r[i - 1] = i * c[i];
        return new PolynomialArithmetic(r);
    }

    public long evaluate(long x) {
        long acc = 0;
        for (int i = c.length - 1; i >= 0; i--) acc = acc * x + c[i];
        return acc;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (int i = c.length - 1; i >= 0; i--) {
            if (c[i] == 0 && c.length > 1) continue;
            if (sb.length() > 0) sb.append(c[i] < 0 ? " - " : " + ");
            else if (c[i] < 0) sb.append("-");
            long a = Math.abs(c[i]);
            if (a != 1 || i == 0) sb.append(a);
            if (i > 0) sb.append("x");
            if (i > 1) sb.append("^").append(i);
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        PolynomialArithmetic p = new PolynomialArithmetic(1, 1);
        PolynomialArithmetic cube = p.times(p).times(p);
        System.out.println(cube + " | d/dx = " + cube.derivative() + " | at 2: " + cube.evaluate(2));
        System.out.println(new PolynomialArithmetic(-1, 1).times(new PolynomialArithmetic(1, 1)).plus(new PolynomialArithmetic(1)));
    }
}
