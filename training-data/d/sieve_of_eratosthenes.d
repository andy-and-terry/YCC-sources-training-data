import std.stdio;

void main() {
    int limit = 50;
    bool[] isPrime = new bool[](limit + 1);
    isPrime[] = true;
    isPrime[0] = false;
    isPrime[1] = false;
    for (int n = 2; n * n <= limit; n++) {
        if (isPrime[n]) {
            for (int m = n * n; m <= limit; m += n) isPrime[m] = false;
        }
    }
    for (int n = 0; n <= limit; n++) {
        if (isPrime[n]) write(n, " ");
    }
    writeln();
}
