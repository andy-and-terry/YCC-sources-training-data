#include <stdbool.h>
#include <stdio.h>
#include <string.h>

bool luhn_valid(const char *s) {
    int sum = 0, count = 0;
    for (int i = (int)strlen(s) - 1; i >= 0; i--) {
        char c = s[i];
        if (c == ' ') continue;
        if (c < '0' || c > '9') return false;
        int d = c - '0';
        if (count++ % 2 == 1 && (d *= 2) > 9) d -= 9;
        sum += d;
    }
    return count > 1 && sum % 10 == 0;
}

int main(void) {
    printf("%d %d\n", luhn_valid("4539 3195 0343 6467"), luhn_valid("8273 1232 7352 0569"));
    return 0;
}
