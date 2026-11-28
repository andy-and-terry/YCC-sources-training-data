import std.algorithm, std.conv, std.range, std.stdio;

bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) if (n % i == 0) return false;
    return true;
}

bool isPalindrome(int n) {
    auto s = n.to!string;
    return s.equal(s.retro);
}

void main() {
    writeln(iota(2, 200).filter!(n => isPalindrome(n) && isPrime(n))); // [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
}
