#import <Foundation/Foundation.h>

NSInteger gcd(NSInteger a, NSInteger b) {
    while (b != 0) {
        NSInteger temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)gcd(48, 18));
        NSLog(@"%ld", (long)gcd(100, 75));
    }
    return 0;
}
