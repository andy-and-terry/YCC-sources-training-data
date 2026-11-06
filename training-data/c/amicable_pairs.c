/* Amicable pairs: d(a) == b and d(b) == a with a != b. */
#include <stdio.h>

static int d(int n) {
    int s = 0;
    for (int i = 1; i < n; i++)
        if (n % i == 0) s += i;
    return s;
}

int main(void) {
    for (int a = 2; a < 1500; a++) {
        int b = d(a);
        if (b > a && d(b) == a)
            printf("%d %d\n", a, b);
    }
    return 0;
}
