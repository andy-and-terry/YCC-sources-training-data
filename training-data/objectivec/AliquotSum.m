#import <Foundation/Foundation.h>

// Aliquot sum classification.
int main(void) {
    @autoreleasepool {
        for (NSNumber *num in @[@6, @12, @15, @28]) {
            NSInteger n = num.integerValue, a = 0;
            for (NSInteger d = 1; d < n; d++) if (n % d == 0) a += d;
            NSString *kind = a == n ? @"perfect" : (a > n ? @"abundant" : @"deficient");
            NSLog(@"%ld %ld %@", (long)n, (long)a, kind);
        }
    }
    return 0;
}
