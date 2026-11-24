#import <Foundation/Foundation.h>

// Hexagonal numbers: n(2n-1).
int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (int n = 1; n <= 10; n++) [out addObject:@(n * (2 * n - 1))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
