#include <math.h>
#include <stdio.h>

typedef double (*fn)(double);

double newton(fn f, fn df, double x0, double tol, int max_iter, int *iters) {
    double x = x0;
    for (int i = 1; i <= max_iter; i++) {
        double next = x - f(x) / df(x);
        if (fabs(next - x) < tol) {
            if (iters) *iters = i;
            return next;
        }
        x = next;
    }
    if (iters) *iters = -1;
    return NAN;
}

static double target;
static double sq(double x) { return x * x - target; }
static double dsq(double x) { return 2 * x; }
static double g(double x) { return x * x * x - 2 * x - 5; }
static double dg(double x) { return 3 * x * x - 2; }

int main(void) {
    double vals[] = {2, 9, 0.25, 1e10};
    for (int i = 0; i < 4; i++) {
        int it;
        target = vals[i];
        double r = newton(sq, dsq, vals[i] > 1 ? vals[i] : 1, 1e-12, 100, &it);
        printf("sqrt(%g) = %.12f in %d iterations (libm %.12f)\n", vals[i], r, it, sqrt(vals[i]));
    }
    printf("root of x^3-2x-5: %.12f\n", newton(g, dg, 2, 1e-12, 100, NULL));
    return 0;
}
