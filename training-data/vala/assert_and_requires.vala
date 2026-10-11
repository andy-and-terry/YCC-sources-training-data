int safe_div (int a, int b)
    requires (b != 0)
    ensures (result * b <= a)
{
    return a / b;
}

int clamp_index (int i, int len) {
    assert (len > 0);
    return i < 0 ? 0 : (i >= len ? len - 1 : i);
}

void main () {
    stdout.printf ("%d\n", safe_div (17, 5));
    stdout.printf ("%d\n", clamp_index (-3, 10));
    stdout.printf ("%d\n", clamp_index (42, 10));
    return_if_fail (clamp_index (5, 10) == 5);
    stdout.printf ("checks passed\n");
}
