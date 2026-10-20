#import <Foundation/Foundation.h>
int main() {
    @autoreleasepool {
        NSArray *a = @[@"pear", @"fig", @"banana"];
        a = [a sortedArrayUsingComparator:^NSComparisonResult(NSString *x, NSString *y) {
            return [@(x.length) compare:@(y.length)];
        }];
        NSLog(@"%@", a);
    }
    return 0;
}
