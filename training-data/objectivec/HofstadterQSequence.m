#import <Foundation/Foundation.h>

// Hofstadter Q: Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2))
NSArray<NSNumber *> *hofstadterQ(NSInteger count) {
    NSMutableArray<NSNumber *> *q = [NSMutableArray arrayWithObjects:@0, @1, @1, nil]; // index 0 unused
    for (NSInteger n = 3; n <= count; n++) {
        NSInteger first = q[n - q[n - 1].integerValue].integerValue;
        NSInteger second = q[n - q[n - 2].integerValue].integerValue;
        [q addObject:@(first + second)];
    }
    [q removeObjectAtIndex:0];
    return q;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [hofstadterQ(20) componentsJoinedByString:@" "]);
    }
    return 0;
}
