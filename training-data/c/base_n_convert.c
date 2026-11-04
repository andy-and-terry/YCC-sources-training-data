#include <stdio.h>
#include <string.h>

void to_base(unsigned long n, int base, char *out) {
    const char *digits = "0123456789abcdefghijklmnopqrstuvwxyz";
    char tmp[65];
    int i = 0;
    if (n == 0) tmp[i++] = '0';
    while (n > 0) { tmp[i++] = digits[n % base]; n /= base; }
    for (int j = 0; j < i; j++) out[j] = tmp[i - 1 - j];
    out[i] = '\0';
}

int main(void) {
    char buf[65];
    int bases[] = {2, 8, 16, 36};
    for (int i = 0; i < 4; i++) {
        to_base(255, bases[i], buf);
        printf("255 in base %d = %s\n", bases[i], buf);
    }
    return 0;
}
