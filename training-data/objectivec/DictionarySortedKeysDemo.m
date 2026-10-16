#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSDictionary<NSString *, NSNumber *> *scores = @{
            @"ann": @92, @"bob": @78, @"cy": @92, @"di": @65
        };

        NSArray *byValue = [scores keysSortedByValueUsingComparator:^NSComparisonResult(NSNumber *x, NSNumber *y) {
            return [y compare:x];
        }];
        NSLog(@"by score desc: %@", [byValue subarrayWithRange:NSMakeRange(0, 1)]);

        NSArray *names = [scores.allKeys sortedArrayUsingSelector:@selector(compare:)];
        for (NSString *n in names) {
            NSLog(@"%@: %@", n, scores[n]);
        }

        NSArray *top = [scores allKeysForObject:@92];
        NSLog(@"top scorers: %@", [top sortedArrayUsingSelector:@selector(compare:)]);

        NSNumber *sum = [scores.allValues valueForKeyPath:@"@sum.self"];
        NSLog(@"sum: %@", sum);
    }
    return 0;
}
