#include <stdio.h>
#include <string.h>
/* Twin primes below 50 via sieve. */
int main(void) {
    char s[53];
    memset(s, 1, sizeof s);
    s[0] = s[1] = 0;
    for (int i = 2; i * i < 53; i++) if (s[i]) for (int j = i * i; j < 53; j += i) s[j] = 0;
    for (int p = 2; p <= 50; p++) if (s[p] && s[p + 2]) printf("(%d,%d) ", p, p + 2);
    printf("\n");
    return 0;
}
