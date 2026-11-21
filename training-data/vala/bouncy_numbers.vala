// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
bool is_bouncy (int n) {
    bool inc = true;
    bool dec = true;
    int prev = n % 10;
    for (int m = n / 10; m > 0; m /= 10) {
        int d = m % 10;
        if (d > prev) inc = false;
        if (d < prev) dec = false;
        prev = d;
    }
    return !inc && !dec;
}

void main () {
    int count = 0;
    for (int n = 1; n < 1000; n++) {
        if (is_bouncy (n)) count++;
    }
    print ("%d\n", count);
}
