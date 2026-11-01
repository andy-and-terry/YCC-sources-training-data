#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSDictionary *d = @{ @"a": @1, @"b": @2, @"c": @3 };
        for (NSString *k in [d.allKeys sortedArrayUsingSelector:@selector(compare:)])
            NSLog(@"%@ -> %@", k, d[k]);
        NSArray *nums = @[@5, @2, @9];
        NSLog(@"%@", [nums sortedArrayUsingSelector:@selector(compare:)]);
    }
    return 0;
}
