#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSArray *a = @[@"pear", @"fig", @"banana"];
        NSArray *s = [a sortedArrayUsingComparator:^NSComparisonResult(NSString *x, NSString *y) {
            return [@(x.length) compare:@(y.length)];
        }];
        NSLog(@"%@", s);
    }
    return 0;
}
