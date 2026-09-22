int divide(int a, int b)
    requires (b != 0)
    ensures (result * b <= a)
{
    return a / b;
}

int clamp(int value, int lower, int upper)
    requires (lower <= upper)
    ensures (result >= lower && result <= upper)
{
    if (value < lower) {
        return lower;
    }
    if (value > upper) {
        return upper;
    }
    return value;
}

void main() {
    stdout.printf("%d\n", divide(10, 3));
    stdout.printf("%d\n", clamp(15, 0, 10));
    stdout.printf("%d\n", clamp(-5, 0, 10));
    stdout.printf("%d\n", clamp(5, 0, 10));
}
