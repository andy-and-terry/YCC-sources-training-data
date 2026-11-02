#include <stdio.h>

static void swap(char **a, char **b) { char *t = *a; *a = *b; *b = t; }

int main(void) {
    char *x = "left", *y = "right";
    swap(&x, &y);
    printf("%s %s\n", x, y);
    return 0;
}
