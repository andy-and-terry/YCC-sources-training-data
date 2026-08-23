#import <Foundation/Foundation.h>

NSInteger myGcd(NSInteger a, NSInteger b) {
    while (b != 0) {
        NSInteger t = b;
        b = a % b;
        a = t;
    }
    return labs(a);
}

NSInteger myLcm(NSInteger a, NSInteger b) {
    return labs(a * b) / myGcd(a, b);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)myGcd(48, 18));
        NSLog(@"%ld", (long)myLcm(4, 6));
    }
    return 0;
}
