// Amicable pairs: d(a) == b and d(b) == a with a != b.
#import <Foundation/Foundation.h>

static int d(int n) {
    int s = 0;
    for (int i = 1; i < n; i++) if (n % i == 0) s += i;
    return s;
}

int main(void) {
    @autoreleasepool {
        for (int a = 2; a < 1500; a++) {
            int b = d(a);
            if (b > a && d(b) == a) NSLog(@"%d %d", a, b);
        }
    }
    return 0;
}
