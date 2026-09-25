#include <ctype.h>
#include <stdio.h>

void atbash_encode(const char *in, char *out) {
    int n = 0;
    for (; *in; in++) {
        unsigned char c = (unsigned char)*in;
        if (!isalnum(c)) continue;
        if (n && n % 5 == 0) *out++ = ' ';
        *out++ = isalpha(c) ? (char)('z' - (tolower(c) - 'a')) : (char)c;
        n++;
    }
    *out = '\0';
}

int main(void) {
    char buf[128];
    atbash_encode("The quick brown fox", buf);
    puts(buf);
    return 0;
}
