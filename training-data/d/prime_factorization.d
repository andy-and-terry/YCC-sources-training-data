import std.stdio;

int[] primeFactors(int n) {
    int[] factors;
    int num = n;
    for (int p = 2; p * p <= num; p++) {
        while (num % p == 0) {
            factors ~= p;
            num /= p;
        }
    }
    if (num > 1) factors ~= num;
    return factors;
}

void main() {
    writeln(primeFactors(360));
    writeln(primeFactors(97));
    writeln(primeFactors(1));
}
