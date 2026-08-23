#import <Foundation/Foundation.h>

NSInteger myPower(NSInteger base, NSInteger exp) {
    if (exp == 0) return 1;
    if (exp % 2 == 0) {
        NSInteger half = myPower(base, exp / 2);
        return half * half;
    }
    return base * myPower(base, exp - 1);
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)myPower(2, 10));
        NSLog(@"%ld", (long)myPower(3, 5));
    }
    return 0;
}
