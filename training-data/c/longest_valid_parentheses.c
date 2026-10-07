#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int longest_valid(const char *s) {
    int n = (int)strlen(s), best = 0, top = 0;
    int *stack = malloc((size_t)(n + 1) * sizeof *stack);
    stack[top++] = -1;
    for (int i = 0; i < n; i++) {
        if (s[i] == '(') {
            stack[top++] = i;
        } else {
            top--;
            if (top == 0) stack[top++] = i;
            else if (i - stack[top - 1] > best) best = i - stack[top - 1];
        }
    }
    free(stack);
    return best;
}

int main(void) {
    const char *tests[] = {"(()", ")()())", "", "()(()", "((()))()"};
    for (int i = 0; i < 5; i++) printf("\"%s\" %d\n", tests[i], longest_valid(tests[i]));
    return 0;
}
