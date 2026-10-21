#include <stdio.h>
#include <string.h>

static void to_bt(long n, char *buf) {
    char tmp[64];
    int len = 0;
    if (n == 0) { strcpy(buf, "0"); return; }
    while (n != 0) {
        long r = ((n % 3) + 3) % 3;
        if (r == 0) tmp[len++] = '0';
        else if (r == 1) { tmp[len++] = '+'; n--; }
        else { tmp[len++] = '-'; n++; }
        n /= 3;
    }
    for (int i = 0; i < len; i++) buf[i] = tmp[len - 1 - i];
    buf[len] = '\0';
}

static long from_bt(const char *s) {
    long n = 0;
    for (; *s; s++) n = n * 3 + (*s == '+') - (*s == '-');
    return n;
}

int main(void) {
    long vals[] = {-14, -1, 0, 5, 42};
    char buf[64];
    for (int i = 0; i < 5; i++) {
        to_bt(vals[i], buf);
        printf("%ld %s %s\n", vals[i], buf, from_bt(buf) == vals[i] ? "ok" : "BAD");
    }
    return 0;
}
