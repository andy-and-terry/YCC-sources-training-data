#import <Foundation/Foundation.h>

static BOOL isPrime(NSInteger n) {
    if (n < 2) return NO;
    for (NSInteger i = 2; i * i <= n; i++) if (n % i == 0) return NO;
    return YES;
}

static BOOL isPalindrome(NSInteger n) {
    NSInteger r = 0;
    for (NSInteger m = n; m > 0; m /= 10) r = r * 10 + m % 10;
    return r == n;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *result = [NSMutableArray array];
        for (NSInteger n = 2; n < 200; n++) {
            if (isPalindrome(n) && isPrime(n)) [result addObject:@(n)];
        }
        NSLog(@"%@", [result componentsJoinedByString:@" "]); // 2 3 5 7 11 101 131 151 181 191
    }
    return 0;
}
