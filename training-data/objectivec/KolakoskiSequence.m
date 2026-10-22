#import <Foundation/Foundation.h>

// Kolakoski over {1, 2}: the run lengths of the sequence describe itself
NSArray<NSNumber *> *kolakoskiSequence(NSUInteger count) {
    NSMutableArray<NSNumber *> *terms = [NSMutableArray arrayWithObjects:@1, @2, @2, nil];
    NSUInteger idx = 2;
    while (terms.count < count) {
        NSInteger sym = 3 - terms.lastObject.integerValue;
        for (NSInteger k = 0; k < terms[idx].integerValue; k++) {
            [terms addObject:@(sym)];
        }
        idx++;
    }
    return [terms subarrayWithRange:NSMakeRange(0, count)];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [kolakoskiSequence(20) componentsJoinedByString:@" "]);
    }
    return 0;
}
