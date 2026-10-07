#include <ctype.h>
#include <stdio.h>
#include <string.h>

static char *trim(char *s) {
    while (isspace((unsigned char)*s)) s++;
    if (*s == '\0') return s;
    char *end = s + strlen(s) - 1;
    while (end > s && isspace((unsigned char)*end)) end--;
    end[1] = '\0';
    return s;
}

int main(void) {
    char text[] = "   \t padded string \n ";
    printf("[%s]\n", trim(text));
    char blank[] = "    ";
    printf("[%s]\n", trim(blank));
    return 0;
}
