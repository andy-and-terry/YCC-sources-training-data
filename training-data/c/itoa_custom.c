#include <stdio.h>
#include <string.h>

static void my_itoa(int n, char *out, int base) {
    static const char digits[] = "0123456789abcdef";
    char tmp[34];
    int i = 0, neg = n < 0;
    unsigned u = neg ? 0u - (unsigned)n : (unsigned)n;
    do { tmp[i++] = digits[u % base]; u /= base; } while (u);
    if (neg) tmp[i++] = '-';
    for (int j = 0; j < i; j++) out[j] = tmp[i - 1 - j];
    out[i] = '\0';
}

int main(void) {
    char buf[40];
    my_itoa(255, buf, 10); printf("%s\n", buf);
    my_itoa(255, buf, 16); printf("%s\n", buf);
    my_itoa(-42, buf, 2);  printf("%s\n", buf);
    my_itoa(0, buf, 8);    printf("%s\n", buf);
    return 0;
}
