/* Maximum nesting depth of parentheses; -1 if the string is unbalanced. */
#include <stdio.h>

static int max_depth(const char *s) {
    int depth = 0, best = 0;
    for (; *s; s++) {
        if (*s == '(') { if (++depth > best) best = depth; }
        else if (*s == ')' && --depth < 0) return -1;
    }
    return depth == 0 ? best : -1;
}

int main(void) {
    printf("%d %d\n", max_depth("(1+(2*(3)))"), max_depth("(()"));
    return 0;
}
