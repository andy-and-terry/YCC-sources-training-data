#include <stdio.h>

static void rot47(char *s) {
    for (; *s; s++)
        if (*s >= 33 && *s <= 126) *s = (char)(33 + (*s - 33 + 47) % 94);
}

int main(void) {
    char msg[] = "Hello, World!";
    rot47(msg);
    printf("%s\n", msg);
    rot47(msg);
    printf("%s\n", msg);
    return 0;
}
