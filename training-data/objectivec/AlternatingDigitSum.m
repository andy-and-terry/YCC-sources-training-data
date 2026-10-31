#import <Foundation/Foundation.h>

NSInteger alternatingDigitSum(NSInteger n) {
    NSInteger total = 0, sign = 1;
    for (; n > 0; n /= 10, sign = -sign) total += sign * (n % 10);
    return total;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        for (NSNumber *value in @[@1234, @99999, @1000]) {
            NSLog(@"%@ %ld", value, (long)alternatingDigitSum(value.integerValue));
        }
    }
    return 0;
}
