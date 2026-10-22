#import <Foundation/Foundation.h>

// Golomb: G(1) = 1, G(n) = 1 + G(n - G(G(n-1)))
NSArray<NSNumber *> *golombSequence(NSInteger count) {
    NSMutableArray<NSNumber *> *g = [NSMutableArray arrayWithObjects:@0, @1, nil]; // index 0 unused
    for (NSInteger n = 2; n <= count; n++) {
        NSInteger inner = g[[g[n - 1] integerValue]].integerValue;
        [g addObject:@(1 + g[n - inner].integerValue)];
    }
    [g removeObjectAtIndex:0];
    return g;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [golombSequence(20) componentsJoinedByString:@" "]);
    }
    return 0;
}
