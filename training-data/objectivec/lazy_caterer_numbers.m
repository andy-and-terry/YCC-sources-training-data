#import <Foundation/Foundation.h>

// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (int n = 0; n < 10; n++) [out addObject:@(n * (n + 1) / 2 + 1)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
