#import <Foundation/Foundation.h>

// Stern's diatomic: s(0) = 0, s(1) = 1, s(2n) = s(n), s(2n+1) = s(n) + s(n+1)
NSArray<NSNumber *> *sternDiatomicSequence(NSInteger count) {
    NSMutableArray *s = [NSMutableArray arrayWithObjects:@0, @1, nil];
    for (NSInteger n = 2; n < count; n++) {
        NSInteger h = n / 2;
        NSInteger value = [s[h] integerValue];
        if (n % 2 == 1) {
            value += [s[h + 1] integerValue];
        }
        [s addObject:@(value)];
    }
    return s;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [sternDiatomicSequence(20) componentsJoinedByString:@" "]);
    }
    return 0;
}
