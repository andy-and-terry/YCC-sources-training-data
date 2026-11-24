#import <Foundation/Foundation.h>

// Pentagonal numbers: n(3n-1)/2.
int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (int n = 1; n <= 10; n++) [out addObject:@(n * (3 * n - 1) / 2)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
