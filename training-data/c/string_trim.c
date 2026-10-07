#include <ctype.h>
#include <stdio.h>
#include <string.h>

/* Trim in place; returns pointer into the same buffer. */
static char *trim(char *s) {
    while (isspace((unsigned char)*s)) s++;
    if (*s == '\0') return s;
    char *end = s + strlen(s) - 1;
    while (end > s && isspace((unsigned char)*end)) end--;
    end[1] = '\0';
    return s;
}

int main(void) {
    char a[] = "   hello world \t\n";
    char b[] = "    ";
    printf("[%s]\n", trim(a));
    printf("[%s]\n", trim(b));
    return 0;
}
