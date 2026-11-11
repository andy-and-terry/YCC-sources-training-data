/* Integer (1..3999) to Roman numeral using a greedy table. */
#include <stdio.h>

static void to_roman(int n, char *out) {
    static const int v[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    static const char *s[] = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
    *out = '\0';
    for (int i = 0; i < 13; i++)
        while (n >= v[i]) {
            for (const char *p = s[i]; *p; p++) *out++ = *p;
            n -= v[i];
        }
    *out = '\0';
}

int main(void) {
    char buf[32];
    to_roman(1994, buf); printf("%s\n", buf);
    to_roman(58, buf);   printf("%s\n", buf);
    return 0;
}
