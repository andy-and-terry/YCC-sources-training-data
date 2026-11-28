#import <Foundation/Foundation.h>

typedef double (^Fn)(double);

static double secant(Fn f, double x0, double x1) {
    for (int i = 0; i < 50; i++) {
        double f0 = f(x0), f1 = f(x1);
        if (f1 == f0) break;
        double next = x1 - f1 * (x1 - x0) / (f1 - f0);
        x0 = x1;
        x1 = next;
        if (fabs(x1 - x0) < 1e-12) break;
    }
    return x1;
}

int main(void) {
    @autoreleasepool { NSLog(@"%.10f", secant(^(double x) { return x * x - 2; }, 1, 2)); }
    return 0;
}
