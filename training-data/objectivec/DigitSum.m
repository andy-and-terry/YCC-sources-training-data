#import <Foundation/Foundation.h>

NSInteger digitSum(NSInteger n) {
    NSInteger total = 0;
    NSInteger num = n;
    while (num > 0) {
        total += num % 10;
        num /= 10;
    }
    return total;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%ld", (long)digitSum(12345));
    }
    return 0;
}
