#import <Foundation/Foundation.h>

BOOL isSphenic(int n) {
    int distinct = 0;
    for (int p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            n /= p;
            if (n % p == 0) return NO;
            distinct++;
        }
    }
    return distinct + (n > 1 ? 1 : 0) == 3;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *found = [NSMutableArray array];
        for (int n = 2; n < 80; n++) {
            if (isSphenic(n)) [found addObject:@(n)];
        }
        NSLog(@"%@", [found componentsJoinedByString:@" "]);
    }
    return 0;
}
