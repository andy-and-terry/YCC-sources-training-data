#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Evaluate a space-separated reverse Polish notation expression. */
static int rpn(const char *expr, double *out) {
    double stack[64];
    int sp = 0;
    char buf[256];
    strncpy(buf, expr, sizeof buf - 1);
    buf[sizeof buf - 1] = '\0';
    for (char *tok = strtok(buf, " "); tok; tok = strtok(NULL, " ")) {
        if (strlen(tok) == 1 && strchr("+-*/", tok[0])) {
            if (sp < 2) return -1;
            double b = stack[--sp], a = stack[--sp];
            switch (tok[0]) {
                case '+': stack[sp++] = a + b; break;
                case '-': stack[sp++] = a - b; break;
                case '*': stack[sp++] = a * b; break;
                case '/': stack[sp++] = a / b; break;
            }
        } else if (sp < 64) {
            stack[sp++] = atof(tok);
        } else {
            return -1;
        }
    }
    if (sp != 1) return -1;
    *out = stack[0];
    return 0;
}

int main(void) {
    double r;
    if (rpn("3 4 + 2 *", &r) == 0) printf("%g\n", r);
    if (rpn("5 1 2 + 4 * + 3 -", &r) == 0) printf("%g\n", r);
    return 0;
}
