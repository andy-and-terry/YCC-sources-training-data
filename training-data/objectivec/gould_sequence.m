#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSMutableArray *out = [NSMutableArray array];
        for (unsigned n = 0; n < 16; n++) [out addObject:@(1u << __builtin_popcount(n))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]);
    }
    return 0;
}
