#include <stdbool.h>
#include <stdio.h>

bool is_valid_isbn10(const char *s) {
    int total = 0, pos = 0;
    for (; *s; s++) {
        int v;
        if (*s == '-') continue;
        if (*s >= '0' && *s <= '9') v = *s - '0';
        else if (*s == 'X' && pos == 9) v = 10;
        else return false;
        if (pos >= 10) return false;
        total += v * (10 - pos++);
    }
    return pos == 10 && total % 11 == 0;
}

int main(void) {
    const char *tests[] = {"3-598-21508-8", "3-598-21507-X", "3-598-21508-9"};
    for (int i = 0; i < 3; i++) printf("%s %d\n", tests[i], is_valid_isbn10(tests[i]));
    return 0;
}
