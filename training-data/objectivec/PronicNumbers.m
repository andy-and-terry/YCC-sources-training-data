#import <Foundation/Foundation.h>

static BOOL isPronic(NSInteger x) {
    NSInteger n = (NSInteger)sqrt((double)x);
    return n * (n + 1) == x;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray *result = [NSMutableArray array];
        for (NSInteger n = 0; n < 10; n++) [result addObject:@(n * (n + 1))];
        NSLog(@"%@", [result componentsJoinedByString:@" "]); // 0 2 6 12 20 30 42 56 72 90
        NSLog(@"%d %d", isPronic(56), isPronic(57)); // 1 0
    }
    return 0;
}
