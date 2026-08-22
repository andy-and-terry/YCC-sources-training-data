errordomain MathError {
    DIVISION_BY_ZERO
}

int safe_divide(int a, int b) throws MathError {
    if (b == 0) {
        throw new MathError.DIVISION_BY_ZERO("cannot divide by zero");
    }
    return a / b;
}

void main() {
    try {
        stdout.printf("%d\n", safe_divide(10, 2));
        stdout.printf("%d\n", safe_divide(5, 0));
    } catch (MathError e) {
        stdout.printf("error: %s\n", e.message);
    }
}
