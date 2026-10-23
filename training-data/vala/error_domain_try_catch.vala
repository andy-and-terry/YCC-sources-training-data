errordomain MathError {
    DIVIDE_BY_ZERO,
    NEGATIVE_ROOT
}

double safe_div(double a, double b) throws MathError {
    if (b == 0) throw new MathError.DIVIDE_BY_ZERO("cannot divide %g by zero", a);
    return a / b;
}

void main() {
    try {
        stdout.printf("%g\n", safe_div(10, 4));
        stdout.printf("%g\n", safe_div(1, 0));
    } catch (MathError e) {
        stdout.printf("error: %s\n", e.message);
    } finally {
        stdout.printf("done\n");
    }
}
