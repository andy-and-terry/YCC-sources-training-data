#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

/* Evaluate a postfix (RPN) expression using a fixed-size stack. */
static int eval_rpn(const char *s, double *result) {
    double st[32];
    int top = 0;
    while (*s) {
        if (isspace((unsigned char)*s)) { s++; continue; }
        if (isdigit((unsigned char)*s)) {
            char *end;
            st[top++] = strtod(s, &end);
            s = end;
            continue;
        }
        if (top < 2) return -1;
        double b = st[--top], a = st[--top];
        switch (*s) {
            case '+': st[top++] = a + b; break;
            case '-': st[top++] = a - b; break;
            case '*': st[top++] = a * b; break;
            case '/': st[top++] = a / b; break;
            default: return -1;
        }
        s++;
    }
    if (top != 1) return -1;
    *result = st[0];
    return 0;
}

int main(void) {
    double r;
    if (eval_rpn("3 4 + 2 * 7 /", &r) == 0) printf("result = %g\n", r);
    return 0;
}
