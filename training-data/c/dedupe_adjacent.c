#include <stdio.h>
/* In-place removal of consecutive duplicate characters (two-pointer). */
static void dedupe(char *s) {
    int w = 0;
    for (int r = 0; s[r]; r++) if (r == 0 || s[r] != s[r - 1]) s[w++] = s[r];
    s[w] = '\0';
}
int main(void) {
    char s[] = "aabbbcdd";
    dedupe(s);
    puts(s);
    return 0;
}
