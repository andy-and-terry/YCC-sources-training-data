#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSDictionary *d = @{@"b": @2, @"a": @1};
        for (NSString *k in [[d allKeys] sortedArrayUsingSelector:@selector(compare:)])
            NSLog(@"%@ => %@", k, d[k]);
    }
    return 0;
}
