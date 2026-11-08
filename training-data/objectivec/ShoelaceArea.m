#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        double x[] = {0, 4, 4, 0}, y[] = {0, 0, 3, 3};
        double s = 0;
        for (int i = 0; i < 4; i++) {
            int j = (i + 1) % 4;
            s += x[i] * y[j] - x[j] * y[i];
        }
        NSLog(@"%g", fabs(s) / 2);
    }
    return 0;
}
