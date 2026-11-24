// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
void main () {
    int64 r = 0;
    for (int n = 1; n <= 8; n++) {
        r = r * 10 + 1;
        print ("%s%s\n", r.to_string (), r % 3 == 0 ? "  (divisible by 3)" : "");
    }
}
