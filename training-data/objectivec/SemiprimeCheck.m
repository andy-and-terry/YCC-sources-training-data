#import <Foundation/Foundation.h>

int primeFactorCount(int n) {
    int count = 0;
    for (int p = 2; p * p <= n; p++) {
        while (n % p == 0) {
            n /= p;
            count++;
        }
    }
    return n > 1 ? count + 1 : count;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *found = [NSMutableArray array];
        for (int n = 2; n < 30; n++) {
            if (primeFactorCount(n) == 2) [found addObject:@(n)];
        }
        NSLog(@"%@", [found componentsJoinedByString:@" "]);
    }
    return 0;
}
