#import <Foundation/Foundation.h>

BOOL isPowerful(int n) {
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            if (n % (p * p) != 0) return NO;
            while (n % p == 0) n /= p;
        }
    }
    return n == 1;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *found = [NSMutableArray array];
        for (int n = 1; n <= 100; n++) {
            if (isPowerful(n)) [found addObject:@(n)];
        }
        NSLog(@"%@", [found componentsJoinedByString:@" "]);
    }
    return 0;
}
