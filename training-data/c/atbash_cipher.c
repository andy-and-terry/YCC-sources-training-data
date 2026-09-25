#include <ctype.h>
#include <stdio.h>

void atbash(char *s) {
    for (; *s; s++) {
        if (islower((unsigned char)*s)) *s = (char)('z' - (*s - 'a'));
        else if (isupper((unsigned char)*s)) *s = (char)('Z' - (*s - 'A'));
    }
}

int main(void) {
    char msg[] = "Hello, World!";
    atbash(msg);
    printf("%s | ", msg);
    atbash(msg);
    printf("%s\n", msg);
    return 0;
}
