#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSDictionary<NSString *, NSNumber *> *d = @{ @"b": @2, @"a": @1, @"c": @3 };
        for (NSString *k in [[d allKeys] sortedArrayUsingSelector:@selector(compare:)]) {
            NSLog(@"%@ => %@", k, d[k]);
        }
        NSArray *byValue = [d keysSortedByValueUsingComparator:^NSComparisonResult(NSNumber *x, NSNumber *y) {
            return [y compare:x];
        }];
        NSLog(@"%@", byValue);
    }
    return 0;
}
