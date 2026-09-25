#include <ctype.h>
#include <stdio.h>
#include <string.h>

typedef enum { ISBN_INVALID, ISBN_10, ISBN_13 } isbn_kind;

isbn_kind isbn_check(const char *raw) {
    char s[16];
    size_t n = 0;
    for (; *raw; raw++) {
        if (*raw == '-' || *raw == ' ') continue;
        if (n >= sizeof s - 1) return ISBN_INVALID;
        s[n++] = (char)toupper((unsigned char)*raw);
    }
    s[n] = '\0';
    if (n == 10) {
        int total = 0;
        for (int i = 0; i < 10; i++) {
            int v;
            if (isdigit((unsigned char)s[i])) v = s[i] - '0';
            else if (i == 9 && s[i] == 'X') v = 10;
            else return ISBN_INVALID;
            total += (10 - i) * v;
        }
        return total % 11 == 0 ? ISBN_10 : ISBN_INVALID;
    }
    if (n == 13) {
        int total = 0;
        for (int i = 0; i < 13; i++) {
            if (!isdigit((unsigned char)s[i])) return ISBN_INVALID;
            total += (s[i] - '0') * (i % 2 ? 3 : 1);
        }
        return total % 10 == 0 ? ISBN_13 : ISBN_INVALID;
    }
    return ISBN_INVALID;
}

int main(void) {
    const char *names[] = {"invalid", "ISBN-10", "ISBN-13"};
    const char *tests[] = {"0-306-40615-2", "0-306-40615-3", "978-0-306-40615-7", "0-8044-2957-X", "12345"};
    for (int i = 0; i < 5; i++) printf("%-20s %s\n", tests[i], names[isbn_check(tests[i])]);
    return 0;
}
