#include <stdio.h>

const char *suffix(int n) {
    int r100 = n % 100, r10 = n % 10;
    if (r100 >= 11 && r100 <= 13) return "th";
    return r10 == 1 ? "st" : r10 == 2 ? "nd" : r10 == 3 ? "rd" : "th";
}

int main(void) {
    int xs[] = {1, 2, 3, 4, 11, 12, 13, 21, 101, 111};
    for (int i = 0; i < 10; i++) printf("%d%s ", xs[i], suffix(xs[i]));
    putchar('\n');
    return 0;
}
