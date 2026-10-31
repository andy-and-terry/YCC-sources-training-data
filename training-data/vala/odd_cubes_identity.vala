int64 cube_from_odds (int64 n) {
    int64 start = n * n - n + 1;
    int64 sum = 0;
    for (int64 i = 0; i < n; i++) {
        sum += start + 2 * i;
    }
    return sum;
}

void main () {
    for (int64 n = 1; n <= 5; n++) {
        print ("%lld %lld %s\n", n, cube_from_odds (n), (cube_from_odds (n) == n * n * n).to_string ());
    }
}
