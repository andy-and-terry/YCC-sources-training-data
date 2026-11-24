#import <Foundation/Foundation.h>

// Fibbinary numbers: no two adjacent 1 bits.
int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (NSUInteger n = 0; n < 50; n++)
            if ((n & (n >> 1)) == 0) [out addObject:@(n)];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
