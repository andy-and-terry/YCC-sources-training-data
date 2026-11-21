#include <stdio.h>
#include <string.h>

/* Cyclops numbers: odd digit count, middle digit zero, no other zeros.
   Count those in 1..99999 (expected 6642). */
static int is_cyclops(int n) {
    char s[16];
    sprintf(s, "%d", n);
    int len = (int)strlen(s), zeros = 0;
    for (int i = 0; i < len; i++)
        if (s[i] == '0') zeros++;
    return len % 2 == 1 && s[len / 2] == '0' && zeros == 1;
}

int main(void) {
    int count = 0;
    for (int n = 1; n < 100000; n++)
        if (is_cyclops(n)) count++;
    printf("%d\n", count);
    return 0;
}
