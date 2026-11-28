#import <Foundation/Foundation.h>

static BOOL isAutomorphic(long long n) {
    NSString *sq = [NSString stringWithFormat:@"%lld", n * n];
    NSString *s = [NSString stringWithFormat:@"%lld", n];
    return [sq hasSuffix:s];
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *result = [NSMutableArray array];
        for (long long n = 0; n < 1000; n++) {
            if (isAutomorphic(n)) [result addObject:@(n)];
        }
        NSLog(@"%@", [result componentsJoinedByString:@" "]); // 0 1 5 6 25 76 376 625
    }
    return 0;
}
