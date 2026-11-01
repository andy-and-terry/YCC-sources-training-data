#import <Foundation/Foundation.h>

static unsigned long long reverseDigits(unsigned long long n) {
    unsigned long long r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

// Reverse-and-add until a palindrome; count the steps.
static int steps(unsigned long long n) {
    for (int count = 0; count < 50; count++) {
        if (count > 0 && n == reverseDigits(n)) return count;
        n += reverseDigits(n);
    }
    return -1;
}

int main(void) {
    @autoreleasepool {
        NSArray<NSNumber *> *starts = @[@56, @57, @59, @79, @89];
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (NSNumber *s in starts) [out addObject:@(steps(s.unsignedLongLongValue))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
