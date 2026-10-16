#include <stdio.h>

static void swap_int(int *a, int *b) {
    int t = *a;
    *a = *b;
    *b = t;
}

static void swap_ptr(const char **a, const char **b) {
    const char *t = *a;
    *a = *b;
    *b = t;
}

int main(void) {
    int x = 3, y = 9;
    const char *s1 = "left", *s2 = "right";
    swap_int(&x, &y);
    swap_ptr(&s1, &s2);
    printf("x=%d y=%d s1=%s s2=%s\n", x, y, s1, s2);
    return 0;
}
