#import <Foundation/Foundation.h>

NSInteger persistence(long long n) {
    NSInteger steps = 0;
    while (n >= 10) {
        long long product = 1;
        for (; n > 0; n /= 10) product *= n % 10;
        n = product;
        steps++;
    }
    return steps;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        for (NSNumber *value in @[@39, @77, @999, @10]) {
            NSLog(@"%@ %ld", value, (long)persistence(value.longLongValue));
        }
    }
    return 0;
}
