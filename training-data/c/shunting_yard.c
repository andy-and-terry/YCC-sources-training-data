#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int prec(char op) {
    switch (op) {
        case '+': case '-': return 1;
        case '*': case '/': return 2;
        case '^': return 3;
        default: return 0;
    }
}

/* Converts infix (single-char ops, integer literals) to space-separated RPN. */
void to_rpn(const char *in, char *out) {
    char ops[64];
    int top = 0;
    size_t w = 0;
    for (const char *p = in; *p; p++) {
        if (isdigit((unsigned char)*p)) {
            while (isdigit((unsigned char)*p)) out[w++] = *p++;
            out[w++] = ' ';
            p--;
        } else if (*p == '(') {
            ops[top++] = *p;
        } else if (*p == ')') {
            while (top && ops[top - 1] != '(') { out[w++] = ops[--top]; out[w++] = ' '; }
            if (top) top--;
        } else if (prec(*p)) {
            while (top && prec(ops[top - 1]) &&
                   (prec(ops[top - 1]) > prec(*p) || (prec(ops[top - 1]) == prec(*p) && *p != '^'))) {
                out[w++] = ops[--top];
                out[w++] = ' ';
            }
            ops[top++] = *p;
        }
    }
    while (top) { out[w++] = ops[--top]; out[w++] = ' '; }
    out[w ? w - 1 : 0] = '\0';
}

double eval_rpn(const char *rpn) {
    double st[64];
    int top = 0;
    char buf[256];
    strncpy(buf, rpn, sizeof buf - 1);
    buf[sizeof buf - 1] = '\0';
    for (char *tok = strtok(buf, " "); tok; tok = strtok(NULL, " ")) {
        if (isdigit((unsigned char)tok[0])) {
            st[top++] = atof(tok);
            continue;
        }
        double b = st[--top], a = st[--top];
        switch (tok[0]) {
            case '+': st[top++] = a + b; break;
            case '-': st[top++] = a - b; break;
            case '*': st[top++] = a * b; break;
            case '/': st[top++] = a / b; break;
            case '^': st[top++] = pow(a, b); break;
        }
    }
    return st[0];
}

int main(void) {
    char rpn[256];
    to_rpn("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3", rpn);
    printf("%s = %.10g\n", rpn, eval_rpn(rpn));
    return 0;
}
