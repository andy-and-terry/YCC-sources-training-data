import java.math.BigInteger;

public record FractionArithmetic(BigInteger num, BigInteger den) implements Comparable<FractionArithmetic> {
    public FractionArithmetic {
        if (den.signum() == 0) throw new ArithmeticException("zero denominator");
        if (den.signum() < 0) {
            num = num.negate();
            den = den.negate();
        }
        BigInteger g = num.gcd(den);
        if (!g.equals(BigInteger.ZERO) && !g.equals(BigInteger.ONE)) {
            num = num.divide(g);
            den = den.divide(g);
        }
    }

    public static FractionArithmetic of(long n, long d) {
        return new FractionArithmetic(BigInteger.valueOf(n), BigInteger.valueOf(d));
    }

    public FractionArithmetic plus(FractionArithmetic o) {
        return new FractionArithmetic(num.multiply(o.den).add(o.num.multiply(den)), den.multiply(o.den));
    }

    public FractionArithmetic times(FractionArithmetic o) {
        return new FractionArithmetic(num.multiply(o.num), den.multiply(o.den));
    }

    public FractionArithmetic dividedBy(FractionArithmetic o) {
        return new FractionArithmetic(num.multiply(o.den), den.multiply(o.num));
    }

    @Override
    public int compareTo(FractionArithmetic o) {
        return num.multiply(o.den).compareTo(o.num.multiply(den));
    }

    @Override
    public String toString() {
        return den.equals(BigInteger.ONE) ? num.toString() : num + "/" + den;
    }

    public static void main(String[] args) {
        FractionArithmetic a = of(1, 3), b = of(1, 6);
        System.out.println(a.plus(b) + " " + a.times(b) + " " + a.dividedBy(b) + " cmp=" + a.compareTo(b));
        FractionArithmetic h = of(0, 1);
        for (int k = 1; k <= 20; k++) h = h.plus(of(1, k));
        System.out.println("H(20) = " + h);
    }
}
