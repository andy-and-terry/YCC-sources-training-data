#import <Foundation/Foundation.h>

// Van Eck: next term is the distance since the last term previously appeared, else 0
NSArray<NSNumber *> *vanEckSequence(NSInteger count) {
    NSMutableArray *seq = [NSMutableArray arrayWithObject:@0];
    for (NSInteger n = 1; n < count; n++) {
        NSInteger next = 0;
        for (NSInteger k = n - 2; k >= 0; k--) {
            if ([seq[k] isEqual:seq[n - 1]]) {
                next = n - 1 - k;
                break;
            }
        }
        [seq addObject:@(next)];
    }
    return seq;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [vanEckSequence(20) componentsJoinedByString:@" "]);
    }
    return 0;
}
