#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

static int luhn_sum(const char *s, bool append_zero) {
    int sum = 0, pos = append_zero ? 1 : 0;
    for (int i = (int)strlen(s) - 1; i >= 0; i--) {
        if (!isdigit((unsigned char)s[i])) continue;
        int d = s[i] - '0';
        if (pos++ % 2 == 1) {
            d *= 2;
            if (d > 9) d -= 9;
        }
        sum += d;
    }
    return sum;
}

bool luhn_valid(const char *s) {
    int digits = 0;
    for (const char *p = s; *p; p++) {
        if (isdigit((unsigned char)*p)) digits++;
        else if (*p != ' ') return false;
    }
    return digits > 1 && luhn_sum(s, false) % 10 == 0;
}

int luhn_check_digit(const char *partial) { return (10 - luhn_sum(partial, true) % 10) % 10; }

int main(void) {
    printf("%d %d %d\n", luhn_valid("4539 3195 0343 6467"), luhn_valid("8273 1232 7352 0569"), luhn_valid("12a4"));
    printf("check digit for 7992739871: %d\n", luhn_check_digit("7992739871"));
    return 0;
}
