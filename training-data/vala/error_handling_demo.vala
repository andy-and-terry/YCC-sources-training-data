errordomain MathError {
    DIVISION_BY_ZERO
}

int safe_divide(int a, int b) throws MathError {
    if (b == 0) {
        throw new MathError.DIVISION_BY_ZERO("Cannot divide by zero");
    }
    return a / b;
}

void main() {
    try {
        int result = safe_divide(10, 0);
        stdout.printf("%d\n", result);
    } catch (MathError e) {
        stdout.printf("Caught: %s\n", e.message);
    }

    try {
        int result = safe_divide(10, 2);
        stdout.printf("%d\n", result);
    } catch (MathError e) {
        stdout.printf("Caught: %s\n", e.message);
    }
}
