#include <stdio.h>

int main(void) {
    for (long long n = 1; n <= 10; n++) {
        printf("%s%lld", n > 1 ? " " : "", n * (1LL << n) - 1);
    }
    printf("\n");
    return 0;
}
