#import <Foundation/Foundation.h>

// Recaman: a(n) = a(n-1) - n if positive and unseen, else a(n-1) + n
NSArray<NSNumber *> *recamanSequence(NSInteger count) {
    NSMutableArray *terms = [NSMutableArray arrayWithObject:@0];
    NSMutableSet *seen = [NSMutableSet setWithObject:@0];
    NSInteger cur = 0;
    for (NSInteger i = 1; i < count; i++) {
        NSInteger next = cur - i;
        if (next < 0 || [seen containsObject:@(next)]) {
            next = cur + i;
        }
        [seen addObject:@(next)];
        [terms addObject:@(next)];
        cur = next;
    }
    return terms;
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [recamanSequence(20) componentsJoinedByString:@" "]);
    }
    return 0;
}
