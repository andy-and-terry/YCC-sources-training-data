#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSArray<NSString *> *words = [@"the cat and the hat and the bat" componentsSeparatedByString:@" "];
        NSCountedSet *counts = [NSCountedSet setWithArray:words];

        NSArray *sorted = [[counts allObjects] sortedArrayUsingComparator:^NSComparisonResult(NSString *a, NSString *b) {
            NSComparisonResult r = [@([counts countForObject:b]) compare:@([counts countForObject:a])];
            return r != NSOrderedSame ? r : [a compare:b];
        }];

        for (NSString *w in sorted) {
            NSLog(@"%@: %lu", w, (unsigned long)[counts countForObject:w]);
        }
        NSLog(@"distinct: %lu", (unsigned long)counts.count);
    }
    return 0;
}
