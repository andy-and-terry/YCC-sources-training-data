#import <Foundation/Foundation.h>

BOOL isPowerOfTwo(NSInteger n) {
    return n > 0 && (n & (n - 1)) == 0;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%d", isPowerOfTwo(16));
        NSLog(@"%d", isPowerOfTwo(18));
    }
    return 0;
}
