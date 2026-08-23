#import <Foundation/Foundation.h>

NSArray *sieve(NSInteger limit) {
    BOOL isComposite[limit + 1];
    memset(isComposite, 0, sizeof(isComposite));
    for (NSInteger i = 2; i * i <= limit; i++) {
        if (!isComposite[i]) {
            for (NSInteger j = i * i; j <= limit; j += i) {
                isComposite[j] = YES;
            }
        }
    }
    NSMutableArray *primes = [NSMutableArray array];
    for (NSInteger n = 2; n <= limit; n++) {
        if (!isComposite[n]) [primes addObject:@(n)];
    }
    return primes;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", sieve(50));
    }
    return 0;
}
