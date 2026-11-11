// Population count (number of set bits) for 0..15
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (unsigned n = 0; n < 16; n++) [out addObject:@(__builtin_popcount(n))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
