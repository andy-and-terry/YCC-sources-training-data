#include <stdio.h>
#include <string.h>

#define MAXDEG 32

typedef struct {
    int deg;
    long long c[MAXDEG + 1];
} poly;

static poly poly_make(int deg, const long long *coeffs) {
    poly p = {deg, {0}};
    memcpy(p.c, coeffs, (size_t)(deg + 1) * sizeof *coeffs);
    return p;
}

static void normalize(poly *p) {
    while (p->deg > 0 && p->c[p->deg] == 0) p->deg--;
}

poly poly_mul(poly a, poly b) {
    poly r = {a.deg + b.deg, {0}};
    for (int i = 0; i <= a.deg; i++)
        for (int j = 0; j <= b.deg; j++) r.c[i + j] += a.c[i] * b.c[j];
    normalize(&r);
    return r;
}

poly poly_derivative(poly p) {
    poly r = {p.deg > 0 ? p.deg - 1 : 0, {0}};
    for (int i = 1; i <= p.deg; i++) r.c[i - 1] = i * p.c[i];
    return r;
}

long long poly_eval(poly p, long long x) {
    long long acc = 0;
    for (int i = p.deg; i >= 0; i--) acc = acc * x + p.c[i];
    return acc;
}

void poly_print(poly p) {
    int first = 1;
    for (int i = p.deg; i >= 0; i--) {
        if (p.c[i] == 0 && p.deg) continue;
        printf("%s%lld", first ? "" : " + ", p.c[i]);
        if (i > 0) printf("x");
        if (i > 1) printf("^%d", i);
        first = 0;
    }
    printf("\n");
}

int main(void) {
    long long one_plus_x[] = {1, 1};
    poly p = poly_make(1, one_plus_x), q = p;
    for (int i = 0; i < 4; i++) q = poly_mul(q, p);
    poly_print(q);
    poly_print(poly_derivative(q));
    printf("(1+x)^5 at x=2: %lld\n", poly_eval(q, 2));
    return 0;
}
