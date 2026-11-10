#import <Foundation/Foundation.h>

// Read the binary digits of i as base-4 digits.
static NSInteger moserDeBruijn(NSInteger i) {
    NSInteger value = 0, power = 1;
    for (; i > 0; i >>= 1) {
        if (i & 1) value += power;
        power *= 4;
    }
    return value;
}

int main(void) {
    @autoreleasepool {
        NSMutableArray<NSNumber *> *out = [NSMutableArray array];
        for (NSInteger i = 0; i < 10; i++) [out addObject:@(moserDeBruijn(i))];
        NSLog(@"%@", [out componentsJoinedByString:@" "]); // 0 1 4 5 16 17 20 21 64 65
    }
    return 0;
}
