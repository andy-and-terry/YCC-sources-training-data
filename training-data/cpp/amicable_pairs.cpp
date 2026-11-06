// Amicable pairs: d(a) == b and d(b) == a with a != b.
#include <iostream>

int d(int n) {
    int s = 0;
    for (int i = 1; i < n; ++i)
        if (n % i == 0) s += i;
    return s;
}

int main() {
    for (int a = 2; a < 1500; ++a) {
        int b = d(a);
        if (b > a && d(b) == a) std::cout << '(' << a << ", " << b << ")\n";
    }
}
