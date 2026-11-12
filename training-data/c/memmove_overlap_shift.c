#include <stdio.h>
#include <string.h>
int main(void) {
    char s[] = "abcdefgh";
    memmove(s + 2, s, 5);
    printf("%s\n", s);
    return 0;
}
