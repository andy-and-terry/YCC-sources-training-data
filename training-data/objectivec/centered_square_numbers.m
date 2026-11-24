#import <Foundation/Foundation.h>

// Centered square numbers: n^2 + (n+1)^2.
int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (int n = 0; n < 10; n++) [out addObject:@(n * n + (n + 1) * (n + 1))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
