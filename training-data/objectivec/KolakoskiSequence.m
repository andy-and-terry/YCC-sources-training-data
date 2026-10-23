#import <Foundation/Foundation.h>

// Kolakoski: a sequence of 1s and 2s that describes its own run lengths
NSArray<NSNumber *> *kolakoskiSequence(NSInteger count) {
    NSMutableArray *seq = [NSMutableArray arrayWithObjects:@1, @2, @2, nil];
    NSInteger i = 2; // index of the term giving the next run length
    while ((NSInteger)seq.count < count) {
        NSNumber *symbol = (i % 2 == 0) ? @1 : @2;
        NSInteger run = [seq[i] integerValue];
        for (NSInteger j = 0; j < run; j++) {
            [seq addObject:symbol];
        }
        i++;
    }
    return [seq subarrayWithRange:NSMakeRange(0, count)];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [kolakoskiSequence(20) componentsJoinedByString:@" "]);
    }
    return 0;
}
