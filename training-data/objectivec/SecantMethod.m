#import <Foundation/Foundation.h>

typedef double (^Fn)(double);

double secant(Fn f, double a, double b) {
    for (int i = 0; i < 40; i++) {
        double fa = f(a), fb = f(b);
        if (fa == fb) break;
        double c = b - fb * (b - a) / (fb - fa);
        a = b; b = c;
    }
    return b;
}

int main(void) {
    @autoreleasepool { NSLog(@"%.8f", secant(^(double x) { return x * x - 2; }, 1, 2)); }
    return 0;
}
