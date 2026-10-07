#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

/* Recursive-descent evaluator: expr := term (('+'|'-') term)*, etc. */
typedef struct {
    const char *p;
    int error;
} parser;

static double expr(parser *ps);

static void skip(parser *ps) {
    while (isspace((unsigned char)*ps->p)) ps->p++;
}

static double primary(parser *ps) {
    skip(ps);
    if (*ps->p == '(') {
        ps->p++;
        double v = expr(ps);
        skip(ps);
        if (*ps->p == ')') ps->p++;
        else ps->error = 1;
        return v;
    }
    if (*ps->p == '-') {
        ps->p++;
        return -primary(ps);
    }
    char *end;
    double v = strtod(ps->p, &end);
    if (end == ps->p) ps->error = 1;
    ps->p = end;
    return v;
}

static double power(parser *ps) {
    double base = primary(ps);
    skip(ps);
    if (*ps->p == '^') {
        ps->p++;
        return pow(base, power(ps));
    }
    return base;
}

static double term(parser *ps) {
    double v = power(ps);
    for (;;) {
        skip(ps);
        if (*ps->p == '*') { ps->p++; v *= power(ps); }
        else if (*ps->p == '/') { ps->p++; v /= power(ps); }
        else return v;
    }
}

static double expr(parser *ps) {
    double v = term(ps);
    for (;;) {
        skip(ps);
        if (*ps->p == '+') { ps->p++; v += term(ps); }
        else if (*ps->p == '-') { ps->p++; v -= term(ps); }
        else return v;
    }
}

int evaluate(const char *s, double *out) {
    parser ps = {s, 0};
    *out = expr(&ps);
    skip(&ps);
    return ps.error || *ps.p ? -1 : 0;
}

int main(void) {
    const char *tests[] = {"1 + 2 * 3", "(1 + 2) * 3", "2 ^ 3 ^ 2", "-4 + 10 / 4", "2 * (3 + ", "-(2+3)*2"};
    for (int i = 0; i < 6; i++) {
        double v;
        if (evaluate(tests[i], &v) == 0) printf("%-12s = %g\n", tests[i], v);
        else printf("%-12s : syntax error\n", tests[i]);
    }
    return 0;
}
